class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :prize_category
  belongs_to :team

  validates_presence_of :team
end
