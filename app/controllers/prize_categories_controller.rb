class PrizeCategoriesController < ApplicationController
  def index
    @prize_categories = PrizeCategory.all
  end
end
