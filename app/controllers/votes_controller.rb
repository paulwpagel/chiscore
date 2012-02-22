class VotesController < ApplicationController
  def create
    @prize_category = PrizeCategory.find(params[:prize_category_id])
    votes = @prize_category.votes.where(:user_id => current_user.id)
    if votes.any?
      votes.first.update_attributes(params[:vote])
      redirect_to prize_categories_path, :notice => "Changed your vote. Thanks."
    else
      @vote = Vote.create!(params[:vote].merge('user_id' => current_user.id))
      redirect_to prize_categories_path, :notice => "Thanks for voting, now get back to work"
    end
  end
end
