require 'spec_helper'

describe Checkpoint do

  before(:each) do
    Checkpoint.destroy_all
  end

  it "creates all" do
    Checkpoint.create_all
    Checkpoint.count.should == 12
  end

  it "finds the start" do
    Checkpoint.create_all
    start = Checkpoint.find_by_location("Start")
    Checkpoint.start.should == start
  end

  it "associates with prize_categories" do
    Checkpoint.new.prize_categories.should == []
  end
end
