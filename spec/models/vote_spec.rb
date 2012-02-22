require 'spec_helper'

describe Vote do

  let(:user) { User.create!(:login => "test_user", :password => "password", :password_confirmation => "password") }
  let(:prize_category) { PrizeCategory.create!(:name => "Biggest Loser")}
  let(:team) { Team.create!(:name => "The Killers") }

  it "belongs to a user" do
    Vote.create!(:user => user, :team => team).user.should == user
  end

  it "belongs to a prize_category" do
    Vote.create!(:prize_category => prize_category, :team => team).prize_category.should == prize_category
  end

  it "belongs to a team" do
    Vote.create!(:team => team).team.should == team
  end

  it "is invalid without a team" do
    vote = Vote.new
    vote.valid?.should_not be true
    vote.team = team
    vote.valid?.should be_true
  end
end
