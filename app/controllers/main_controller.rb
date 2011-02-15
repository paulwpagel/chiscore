class MainController < ApplicationController
  before_filter :load_checkins
  def index
    @checkpoints = Checkpoint.all
    @team_checkin = TeamCheckin.new
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
    @team = Team.find_by_number(params[:team_number])
    TeamCheckin.create!(:checkpoint_id => session[:current_checkpoint_id], :team_id => @team.id)
    respond_to do |format|
      format.html {redirect_to(:controller => :main, :action => :index)}
    end    
  end
  
  def checkins
    @checkins = TeamCheckin.find_all_by_checkpoint_id(session[:current_checkpoint_id])
    render :partial => "main/checkins"
  end
  
  def reload_checkins
    render :partial => 'main/checkin_lists'
  end
  
  private
    
    def load_checkins
      @checkins = TeamCheckin.find_all_by_checkpoint_id(session[:current_checkpoint_id]) if session[:current_checkpoint_id]
    end
end
