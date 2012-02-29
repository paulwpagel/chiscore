require 'spec_helper'

describe MainController do
  before(:each) do
    Checkpoint.destroy_all
    TeamCheckin.destroy_all
    Team.destroy_all
    User.destroy_all
    @checkpoint = Checkpoint.create!(:location => "Flat Iron")
    @user = User.create!(:login => "Flat Iron", :password => "password", :password_confirmation => "password", :checkpoint_id => @checkpoint.id)
    login_user(@user)
    @team = Team.create!(:name => "asdf", :number => "34")
    session[:current_checkpoint_id] = @checkpoint.id
  end

  it "loads user checkpoint" do
    get :index
    assigns[:checkpoints].should == [@user.checkpoint]
  end

  context "#change_checkpoint" do
    it "sets current checkpoint to null" do
      get :change_checkpoint
      session[:current_checkpoint_id].should be_nil
    end
  end

  context "#set_checkpoint" do
    it "sets the current checkpoint in the controller" do
      post :set_checkpoint, :checkpoint_id => @checkpoint.id
      session[:current_checkpoint_id].should == @checkpoint.id
    end
  end

  context "#checkin" do
    it "creates a checkin" do
      post :checkin, :team_number => @team.number
      checkin = TeamCheckin.last

      checkin.should_not be_nil
      checkin.team.should == @team
      checkin.checkpoint.should == @checkpoint
    end
  end

  context "#checkins" do
    it "loads up the checkins for the current checkpoint" do
      checkin = TeamCheckin.create!(:checkpoint_id => @checkpoint.id)
      TeamCheckin.create!

      get :checkins
      assigns[:checkins].should == [checkin]
    end
  end

  context "#start_race" do
    it "starts the race" do
      @team = Team.create!(:name => "action squad")
      Checkpoint.create!(:location => "Start")

      get :start_race

      @team.reload
      @team.team_checkins.first.should_not be_nil
    end
  end

  context "#checkout" do
    it "checkout time" do
      @team = Team.create!(:name => "action squad")
      checkpoint = Checkpoint.create!(:location => "Start")
      checkin = TeamCheckin.create!(:team => @team, :checkpoint => checkpoint) 
      get :checkout , :team_checkin_id => checkin.id

      checkin.reload
      checkin.checkout.should_not be_nil
    end
  end

end
