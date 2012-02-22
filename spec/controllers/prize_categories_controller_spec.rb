require 'spec_helper'

describe PrizeCategoriesController do
  context "index" do
      let(:category1) { stub }
      let(:category2) { stub }
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
end
