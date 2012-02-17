class MainController < ApplicationController
  before_filter :load_checkins
  before_filter :require_user

  def index
    @checkpoints = Checkpoint.all if current_user.admin?
    unless current_user.admin?
      @checkpoints = [current_user.checkpoint]
      session[:current_checkpoint_id] = current_user.checkpoint.id
    end
    @team_checkin = TeamCheckin.new
    # @team = Team.find(:params[@team.number])
  end

  def set_checkpoint
    session[:current_checkpoint_id] = params[:checkpoint_id]
    respond_to do |format|
      format.html {redirect_to(:controller => :main, :action => :index)}
    end
  end

  def change_checkpoint
    session[:current_checkpoint_id] = nil
    respond_to do |format|
      format.html {redirect_to(:controller => :main, :action => :index)}
    end
  end

  def checkin
    if @team = Team.find_by_number(params[:team_number])
      if TeamCheckin.find(:first, :conditions => {:checkpoint_id => session[:current_checkpoint_id], :team_id => @team.id})    
        flash[:notice] = "Team #{params[:team_number]}(#{@team.name}) already checked in here."
      else
        checkin = TeamCheckin.new(:checkpoint_id => session[:current_checkpoint_id], :team_id => @team.id)
        if @team.checked_in?
          flash[:notice] = "Team #{params[:team_number]}(#{@team.name}) is checked in at another checkpoint within the last twenty minutes.  Wait and try again."
        elsif checkin.save
          #do nothing
        else
          flash[:notice] = "Team #{params[:team_number]}(#{@team.name}) has already checked in."
        end
      end
    else
      flash[:notice] = "Team #{params[:team_number]} does not exist.  Read better."
    end

    respond_to do |format|
      format.html {redirect_to(:controller => :main, :action => :index )}
    end
  end

  def checkins
    @checkins = TeamCheckin.find_all_by_checkpoint_id(session[:current_checkpoint_id])
    render :partial => "main/checkins"
  end

  def reload_checkins
    render :partial => 'main/checkin_lists'
  end

  def checkout
    checkin = TeamCheckin.find(params[:team_checkin_id])
    checkin.update_attribute(:checkout, Time.now) 
    respond_to do |format|
      format.html {redirect_to(:controller => :main, :action => :index)}
    end
  end

  def start_race
    Team.find_each do |team|
      start = Checkpoint.find_by_location("Start")
      TeamCheckin.create!(:team => team, :checkpoint => start, :checkout => Time.now)
    end
    redirect_to :totals
  end

  private

    def load_checkins
      @checkins = TeamCheckin.find_all_by_checkpoint_id(session[:current_checkpoint_id]) if session[:current_checkpoint_id]
    end
end
