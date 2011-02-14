require 'spec_helper'

describe TeamCheckin do
  
  before do
    TeamCheckin.destroy_all
    Checkpoint.destroy_all
    @checkpoint = Checkpoint.create!(:location => "Flat Iron")
  end
  
  it "expired_checkins" do
    checkin1 = TeamCheckin.create!(:created_at => Time.now - 30.minutes, :checkpoint_id => @checkpoint.id)
    checkin2 = TeamCheckin.create!(:created_at => Time.now - 30.minutes, :checkpoint_id => @checkpoint.id)
    checkin3 = TeamCheckin.create!(:created_at => Time.now - 10.minutes, :checkpoint_id => @checkpoint.id)

    TeamCheckin.expired(@checkpoint).should include(checkin1)
    TeamCheckin.expired(@checkpoint).should include(checkin2)
    TeamCheckin.expired(@checkpoint).should_not include(checkin3)
  end
  
  it "warnings list" do
    checkin1 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) + 30.seconds, :checkpoint_id => @checkpoint.id)
    checkin2 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) +  58.seconds, :checkpoint_id => @checkpoint.id)
    checkin3 = TeamCheckin.create!(:created_at => Time.now - 5.minutes, :checkpoint_id => @checkpoint.id)

    TeamCheckin.warning(@checkpoint).should include(checkin1)
    TeamCheckin.warning(@checkpoint).should include(checkin2)
    TeamCheckin.warning(@checkpoint).should_not include(checkin3)    
  end
  
  it "active list" do
    checkin1 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) + 5.minutes, :checkpoint_id => @checkpoint.id)
    checkin2 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) + 19.minutes, :checkpoint_id => @checkpoint.id)
    checkin3 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) + 21.minutes, :checkpoint_id => @checkpoint.id)
    checkin4 = TeamCheckin.create!(:created_at => (Time.now - 20.minutes) + 50.seconds, :checkpoint_id => @checkpoint.id)

    TeamCheckin.active(@checkpoint).should include(checkin1)
    TeamCheckin.active(@checkpoint).should include(checkin2)
    TeamCheckin.active(@checkpoint).should_not include(checkin3)    
    TeamCheckin.active(@checkpoint).should_not include(checkin4)    
  end
  
  
end
