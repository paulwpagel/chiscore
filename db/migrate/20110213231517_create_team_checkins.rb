class CreateTeamCheckins < ActiveRecord::Migration
  def self.up
    create_table :team_checkins do |t|
      t.integer :checkpoint_id
      t.integer :team_id
      t.timestamps
    end
  end

  def self.down
    drop_table :team_checkins
  end
end
