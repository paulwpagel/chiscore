class Checkpoint < ActiveRecord::Base
  def self.create_all
    ["Start", "Cobra", "Happy Village", "Flat Iron", "Phyllis's", "Five Star", "Finish", 
      "Twisted Spoke", "Innertown", "Nick's", "Darkroom", "Mahoney's"].each do |location|
        Checkpoint.create!(:location => location)
      end
  end
end
