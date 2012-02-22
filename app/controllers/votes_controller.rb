class VotesController < ApplicationController

  def new
    @vote = Vote.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @vote }
    end
  end

  def create
    @vote = Vote.new(params[:team])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to(prize_categories_path, :notice => 'Vote was successfully cast.') }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end
end
