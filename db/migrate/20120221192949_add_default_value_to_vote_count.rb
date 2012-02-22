class AddDefaultValueToVoteCount < ActiveRecord::Migration
  def self.up
    change_column(:votes, :count, :integer, :default => 0)
  end

  def self.down
    change_column(:votes, :count, :integer)
  end
end
