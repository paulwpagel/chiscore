class Vote < ActiveRecord::Base
  has_one :team
  has_one :user
  belongs_to :prize_category
end
