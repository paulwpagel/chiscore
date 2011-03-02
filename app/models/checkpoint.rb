class Checkpoint < ActiveRecord::Base
  has_one :user
  def self.create_all
    ["Start", "Cobra", "Happy Village", "Flat Iron", "Phyllis's", "Five Star", "Finish", 
      "Twisted Spoke", "Innertown", "Nick's", "Darkroom", "Mahoney's", "Club Lucky"].each do |location|
        Checkpoint.create!(:location => location)
      end
  end
end
