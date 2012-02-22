require 'spec_helper'

describe PrizeCategory do
  let(:prize_category) { PrizeCategory.new(:name => "Best Art Cart")}

  it "has many votes" do
    vote = Vote.new
    prize_category.votes << vote
    prize_category.votes.should == [vote]
  end

  it "has a name" do
    prize_category.name.should == "Best Art Cart"
  end

  it "makes sure that the name is not duplicated" do
    prize = PrizeCategory.create(:name => "Best Art Cart")
    prize_category.should_not be_valid
    prize_category.errors_on(:name).should == ["has already been taken"]
  end
end
