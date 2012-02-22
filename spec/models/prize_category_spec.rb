require 'spec_helper'

describe PrizeCategory do
  it "has a name" do
    PrizeCategory.new(:name => "example").name.should == "example"
  end

  it "has votes" do
    PrizeCategory.new.votes.should == []
  end
end
