require 'spec_helper'

describe Team do
  before(:each) do
    Team.destroy_all and Checkpoint.destroy_all and TeamCheckin.destroy_all
    @team = Team.create!(:name => "team", :route => "one")
    @checkpoint = Checkpoint.create!(:location => "Start")
    @checkpoint2 = Checkpoint.create!(:location => "Finish")
  end

  it "has checkins" do
    checkin1 = TeamCheckin.create!(:team => @team, :checkpoint => @checkpoint)
    checkin2 = TeamCheckin.create!(:team => @team, :checkpoint => @checkpoint2)
    @team.team_checkins.should include(checkin1) 
    @team.team_checkins.should include(checkin2) 
  end
  
  it "does something" do
    checkin = TeamCheckin.create!(:team => @team, :checkpoint => @checkpoint)
    @team.checkin_time_for(@checkpoint.location).should == checkin.created_at.strftime("%H:%M:%S")
  end
  
  it "total is undefined" do
    @team.total_time.should be_nil
  end
  
  it "has a current total" do
    TeamCheckin.create(:team => @team, :checkpoint => @checkpoint)
    @team.total_time.should be_within(1).of(@team.team_checkins.first.created_at - Time.now)
  end
  
  it "has a finish time" do
    Checkpoint.destroy_all
    Routes::one.each do |location|
      checkpoint = Checkpoint.create!(:location => location)
      TeamCheckin.create(:team => @team, :checkpoint => checkpoint)
    end
    @team.team_checkins.last.update_attribute(:created_at, Time.now + 15.minutes)
    @team.should be_complete
    @team.total_time.should be_within(1).of(@team.team_checkins.last.created_at - @team.team_checkins.first.created_at)
  end
  
  it "is checked in" do
    TeamCheckin.create(:team => @team, :checkpoint => @checkpoint)
    @team.should be_checked_in
  end
  
  it "is not checked in" do
    TeamCheckin.create(:team => @team, :checkpoint => @checkpoint, :created_at => (Time.now - 20.minutes))
    @team.should_not be_checked_in
  end
  
  it "is not checked in if it was checked out" do
    TeamCheckin.create(:team => @team, :checkpoint => @checkpoint, :checkout => Time.now)
    @team.should_not be_checked_in
  end
  
  it "creates all" do
    Team.destroy_all
    Team.create_all
    Team.count.should == 160
  end
  
end
