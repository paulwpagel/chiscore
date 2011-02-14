class CreateCheckpoints < ActiveRecord::Migration
  def self.up
    create_table :checkpoints do |t|
      t.string :location
      t.integer :number
      t.string :password
      t.string :point_person
      t.timestamps
    end
  end

  def self.down
    drop_table :checkpoints
  end
end
