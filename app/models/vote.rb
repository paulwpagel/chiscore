class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :prize_category
  belongs_to :team

  validates_presence_of :team

  def self.tally(category)
    Vote.where(:prize_category_id => category.id).group_by(&:team).inject([]) do |array, team_tally|
      array <<  {:team => team_tally[0], :count => team_tally[1].count}
    end
  end

  def self.tally_all
    PrizeCategory.all.inject([]) do |array, category|
      array << {:category => category, :votes => tally(category)}
    end
  end
end
