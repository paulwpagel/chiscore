# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
User.create(:login => 'admin', :password => 'sample', :password_confirmation => 'sample')
User.create(:login => 'john', :password => 'sample', :password_confirmation => 'sample')
