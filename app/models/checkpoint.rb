require 'checkpoints'

class Checkpoint < ActiveRecord::Base
  has_one :user
  has_many :prize_categories

  def self.create_all
    Checkpoint.destroy_all
    Checkpoints::ALL.each { |location| Checkpoint.create!(:location => location)}
  end

  def self.start
    return Checkpoint.find_by_location("Start")
  end

  def prize_categories_csv
    self.prize_categories.map(&:name).join(", ")
  end
end
