module PrizeCategories
ALL = [
  "Most Epic Fundraiser",
  "Chitwitterod",
  "Best Art Cart",
  "Best Food Cart",
  "DFL",
  "3rd Place Time",
  "2nd Place Time",
  "1st Place Time",
  "Food Drive - 2nd Place",
  "Food Drive - 1st Place",
  "Bike Marshall's Choice",
  "Most Honorable Dishonorable",
  "3rd Best In Show",
  "2nd Best In Show",
  "Best In Show",
  "Spirit of Chiditarod",
  "Your Cherry's Been Popped",
  "Best Bribe",
  "Best Sabotage",
  "Best Tale of Woe"
]

  def self.create_all
    ALL.each do |name|
      PrizeCategory.create!(:name => name)
    end
  end
end
