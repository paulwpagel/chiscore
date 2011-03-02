class AddCheckpointToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :checkpoint_id, :integer
  end

  def self.down
    remove_column :users, :checkpoint_id
  end
end
