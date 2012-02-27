require 'spec_helper'

describe PrizeCategoriesController do
  let(:category1) { stub }
  let(:category2) { stub }

  context "index" do
    before do
      PrizeCategory.should_receive(:all).and_return([category1, category2])
    end

    it "gets all prize categories" do
      get :index
      assigns(:prize_categories).should == [category1, category2]
    end

    it "renders index" do
      get :index
      response.should render_template "index"
    end

  end

  context "tally" do
    it "gets all votes" do
      tally = stub
      Vote.should_receive(:tally_all).and_return(tally)
      get :tally
      assigns(:tally).should == tally
    end
  end
end
