class Team < ActiveRecord::Base
  has_many :team_checkins
end
