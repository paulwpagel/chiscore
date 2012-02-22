class PrizeCategory < ActiveRecord::Base
  has_many :votes
end
