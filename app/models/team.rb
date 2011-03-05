require "csv"
class Team < ActiveRecord::Base
  include TimeHelper
  has_many :team_checkins
  
  def self.total_times
    return all.sort_by {|team| team.total_time }
  end
  
  def self.number_map(number)
    return "one" if number.to_s == "1"
    return "two" if number.to_s == "2"
    return "three" if number.to_s == "3"
    return "four" if number.to_s == "4"
    return "five" if number.to_s == "5"
    return "six" if number.to_s == "6"
    return "seven" if number.to_s == "7"
    return "eight" if number.to_s == "8"
  end
  
  def self.create_all
    Team.destroy_all
    CSV.foreach(File.expand_path(File.join(Rails.root, "data_sources", "teams.csv"))) do |row|
      begin
        Team.create!(:number => row[0], :route => number_map(row[1]), :name => row[2])
      rescue Exception => e
        puts "row[0]: #{row[0]}"
        puts e.message
        puts e.backtrace
      end
    end
  end
  
  def checkin_time_for(location)
    checkin_for(location).try(:created_at).try(:strftime, "%H:%M:%S")
  end
  
  def total_time
    start = checkin_for("Start")
    return nil unless start.present?
    return (Time.now - start.created_at) unless complete?
    finish = checkin_for("Finish")
    return (finish.created_at - start.created_at)
  end
  
  def complete?
    Routes.send(route).each {|location| return false if checkin_for(location).nil?}
    return true
  end
  
  def checked_in?
    self.team_checkins.each do |checkin|
      return true if (checkin.created_at > (Time.now - 20.minutes) && checkin.checkout.nil?)
    end
    return false
  end
  
  private 
    def checkin_for(location)
      checkpoint = Checkpoint.find_by_location(location)
      return nil if checkpoint.nil?
      return self.team_checkins.find_by_checkpoint_id(checkpoint.id)
    end
    
end
