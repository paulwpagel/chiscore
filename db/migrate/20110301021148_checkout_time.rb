class CheckoutTime < ActiveRecord::Migration
  def self.up
    add_column :team_checkins, :checkout, :datetime
  end

  def self.down
    remove_column :team_checkins, :checkout
  end
end
