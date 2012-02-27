require 'spec_helper'

describe VotesController do


  let(:vote_params) do {'user_id' => user.id, 'team_id' => team.id } end
  let(:prize_category) { PrizeCategory.create!(:name => "Biggest Loser") }
  let(:team) { Team.create!(:name => "Whatever") }
  let(:user) { User.create!(:login => "testuser", :password => "password", :password_confirmation => "password") }

  before do
    Vote.destroy_all
    controller.stub(:current_user).and_return(user)
  end

  describe "#create" do
    it "#create finds the prize_category" do
      post :create, :prize_category_id => prize_category.id, :vote => vote_params

      assigns(:prize_category).should == prize_category
    end

    it "#create creates a new vote" do
      post :create, :prize_category_id => prize_category.id, :vote => vote_params

      response.should redirect_to prize_categories_path
    end
  end

  describe "#new" do
    it "allows new ones to be created" do
      Vote.should_receive(:new)

      get :new, :prize_category_id => prize_category.id
    end
  end
end
