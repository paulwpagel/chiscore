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

  describe '#prize_categories_csv' do
    let(:checkpoint)            { Checkpoint.new }
    let(:prize_categories)      { [PrizeCategory.new(name: name1), PrizeCategory.new(name: name2)] }
    let(:prize_categories_csv)  { "#{name1}, #{name2}" }
    let(:name1)                 { "Best in show" }
    let(:name2)                 { "Worst in show" }

    it "returns the list of prize categories" do
      checkpoint.prize_categories += prize_categories
      checkpoint.prize_categories_csv.should == prize_categories_csv
    end

  end
end
