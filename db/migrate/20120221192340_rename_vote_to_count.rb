class RenameVoteToCount < ActiveRecord::Migration
  def self.up
    rename_column(:votes, :vote, :count)
  end

  def self.down
    rename_column(:votes, :count, :vote)
  end
end
