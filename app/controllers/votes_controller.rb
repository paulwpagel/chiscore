class VotesController < ApplicationController

  def new
    @vote = Vote.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @vote }
    end
  end

end
