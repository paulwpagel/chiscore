require 'spec_helper'

describe Vote do

  let(:vote) { Vote.new }

  context "#count" do
    it "defaults to 0" do
      vote.count.should == 0
    end
  end

  it "belongs_to prize_catgory" do
    vote.prize_category.should == nil
  end

  it "has_one user" do
    vote.user.should == nil
  end

  it "has_one team" do
    vote.team.should == nil
  end
end
