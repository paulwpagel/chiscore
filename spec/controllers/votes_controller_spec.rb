require 'spec_helper'

describe VotesController do

  def mock_vote(stubs={})
    @mock_vote ||= mock_model(Vote, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new checkpoint as @checkpoint" do
      Vote.stub(:new) { mock_vote }
      get :new
      assigns(:vote).should be(mock_vote)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created team as @team" do
        Vote.stub(:new).with({'these' => 'params'}) { mock_vote(:save => true) }
        post :create, :vote => {'these' => 'params'}
        assigns(:vote).should be(mock_vote)
      end

      it "redirects to the created vote" do
        Vote.stub(:new) { mock_vote(:save => true) }
        post :create, :vote => {}
        response.should redirect_to(vote_url(mock_vote))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vote as @vote" do
        Vote.stub(:new).with({'these' => 'params'}) { mock_vote(:save => false) }
        post :create, :vote => {'these' => 'params'}
        assigns(:vote).should be(mock_vote)
      end

      it "re-renders the 'new' template" do
        Vote.stub(:new) { mock_vote(:save => false) }
        post :create, :vote => {}
        response.should render_template("new")
      end
    end
  end

end
