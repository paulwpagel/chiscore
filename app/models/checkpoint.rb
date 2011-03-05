require 'checkpoints'

class Checkpoint < ActiveRecord::Base
  has_one :user
  
  def self.create_all
    Checkpoint.destroy_all
    Checkpoints::ALL.each { |location| Checkpoint.create!(:location => location)}
  end
  
  def self.start
    return Checkpoint.find_by_location(Checkpoints::START)
  end
  
end
