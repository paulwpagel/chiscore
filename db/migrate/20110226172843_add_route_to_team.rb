class AddRouteToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :route, :string
  end

  def self.down
    remove_column :teams, :route
  end
end
