class Team < ActiveRecord::Base
  has_many :team_checkins
  
  def checkin_time_for(location)
    checkpoint = Checkpoint.find_by_location(location)
    return self.team_checkins.find_by_checkpoint_id(checkpoint.id).try(:created_at)
  end
  
end
