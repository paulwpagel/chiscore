require 'spec_helper'

describe Vote do

  let(:user) { create_user("test") }
  let(:prize_category) { PrizeCategory.create!(:name => "Biggest Loser")}
  let(:team) { Team.create!(:name => "The Killers") }

  it "belongs to a user" do
    Vote.create!(:user => user, :team => team).user.should == user
  end

  it "belongs to a prize_category" do
    Vote.create!(:prize_category => prize_category, :team => team).prize_category.should == prize_category
  end

  it "belongs to a team" do
    Vote.create!(:team => team).team.should == team
  end

  it "is invalid without a team" do
    vote = Vote.new
    vote.valid?.should_not be true
    vote.team = team
    vote.valid?.should be_true
  end

  context "counting votes" do

    let(:team2) { Team.create!(:name => "Gregg")}
    let(:team3) { Team.create!(:name => "Ben")}
    let(:team4) { Team.create!(:name => "Paul")}

    it "self.tally gives vote count per team for a given category" do
      [team2, team3, team4].each do |_team|
        _user = create_user(_team.name)
        Vote.create!(:prize_category => prize_category, :team => _team, :user => _user)
      end

      Vote.create!(:prize_category => prize_category, :team => team4, :user => user)

      tally = Vote.tally(prize_category)
      tally.should == [
        {:team => team2, :count => 1 },
        {:team => team3, :count => 1 },
        {:team => team4, :count => 2 }
      ]
    end

    it "self.tally_all gives vote count per team for a each category" do
      category2 = PrizeCategory.create!(:name => "exmpl")
      [team2, team3, team4].each do |_team|
        _user = create_user(_team.name)
        Vote.create!(:prize_category => category2, :team => _team, :user => _user)
        Vote.create!(:prize_category => prize_category, :team => _team, :user => _user)
      end
      Vote.tally_all.should == [
        { :category => category2, :votes => Vote.tally(category2)},
        { :category => prize_category, :votes => Vote.tally(prize_category)},
      ]
    end
  end

  def create_user(login)
    User.create!(:login => login, :password => "password", :password_confirmation => "password")
  end
end
