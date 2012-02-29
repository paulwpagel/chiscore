class PrizeCategoriesController < ApplicationController
  def index
    @prize_categories = PrizeCategory.all
  end

  def show
    @prize_category = PrizeCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prize_category}
    end
  end

  def edit
    @prize_category = PrizeCategory.find(params[:id])
  end

  def update
    @prize_category = PrizeCategory.find(params[:id])

    respond_to do |format|
      if @prize_category.update_attributes(params[:prize_category])
        format.html { redirect_to(@prize_category, :notice => 'Prize Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prize_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @prize_category = PrizeCategory.find(params[:id])
    @prize_category.destroy

    respond_to do |format|
      format.html { redirect_to(prize_categories_url) }
      format.xml  { head :ok }
    end
  end

  def new
    @prize_category = PrizeCategory.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @prize_category }
    end
  end

  def create
    @prize_category = PrizeCategory.new(params[:prize_category])

    respond_to do |format|
      if @prize_category.save
        format.html { redirect_to(@prize_category, :notice => 'Prize Category was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def tally
    @tally = Vote.tally_all
  end

  def cast_votes
    begin
    params[:prize_categories].each do |prize_category_id, team_params|
      category = PrizeCategory.find(prize_category_id)
      vote_params = { :team_id => team_params[:team_id], :prize_category_id => prize_category_id }
      vote_params = vote_params.merge('user_id' => current_user.id)
      vote = category.votes.where(:user_id => current_user.id).first

      if vote.nil?
        Vote.create(vote_params)
      else
        vote.update_attributes(vote_params)
      end
    end

    rescue
      redirect_to prize_categories_path, :notice => "Whoops, try again."
    end
      redirect_to prize_categories_path, :notice => "Alright, thanks for voting."
  end
end
