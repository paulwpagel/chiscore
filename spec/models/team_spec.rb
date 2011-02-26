require 'spec_helper'

describe Team do
  
  it "has checkins" do
    @team = Team.create!(:name => "team")
    checkin1 = TeamCheckin.create!(:team => @team)
    checkin2 = TeamCheckin.create!(:team => @team)
    @team.team_checkins.should include(checkin1) 
    @team.team_checkins.should include(checkin2) 
  end
end
