class PrizeCategory < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :votes
end
