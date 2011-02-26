class Team < ActiveRecord::Base
  include TimeHelper
  has_many :team_checkins
  
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
  
  
  private 
    def checkin_for(location)
      checkpoint = Checkpoint.find_by_location(location)
      return nil if checkpoint.nil?
      return self.team_checkins.find_by_checkpoint_id(checkpoint.id)
    end
  
end
