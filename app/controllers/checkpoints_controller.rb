class CheckpointsController < ApplicationController
  before_filter :require_admin, :except => [:index]

  def index
    @checkpoints = Checkpoint.all 
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @checkpoints }
    end
  end

  def show
    @checkpoint = Checkpoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @checkpoint }
    end
  end

  def new
    @checkpoint = Checkpoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @checkpoint }
    end
  end

  def edit
    @checkpoint = Checkpoint.find(params[:id])
  end
  
  def create
    @checkpoint = Checkpoint.new(params[:checkpoint])

    respond_to do |format|
      if @checkpoint.save
        format.html { redirect_to(@checkpoint, :notice => 'Checkpoint was successfully created.') }
        format.xml  { render :xml => @checkpoint, :status => :created, :location => @checkpoint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @checkpoint.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @checkpoint = Checkpoint.find(params[:id])

    respond_to do |format|
      if @checkpoint.update_attributes(params[:checkpoint])
        format.html { redirect_to(@checkpoint, :notice => 'Checkpoint was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @checkpoint.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @checkpoint = Checkpoint.find(params[:id])
    @checkpoint.destroy

    respond_to do |format|
      format.html { redirect_to(checkpoints_url) }
      format.xml  { head :ok }
    end
  end
end
