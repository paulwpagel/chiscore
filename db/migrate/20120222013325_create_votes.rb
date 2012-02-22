class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :prize_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
