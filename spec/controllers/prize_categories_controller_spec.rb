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

  # let(:prize_category) { PrizeCategory.new(name: "Art Cart of the Decade") }
  # let(:prize_category_2) { PrizeCategory.new(name: "Slow Cart of the Decade") }

  # let(:team) { Team.new(name: "Killas", number: 1) }

  # it "#cast_votes creates multiple votes with appropriate info" do
  #   Vote.should_receive(:create).with(prize_category.id, prize_category_2.id) .exactly(2).times

  #   post :cast_votes, prize_categories: {vote: {team_id: team.id, prize_category_id: prize_category.id}, vote: {team_id: team.id, prize_category_id: prize_category_2.id}}
  # end
end
