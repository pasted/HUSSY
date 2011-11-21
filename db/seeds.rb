# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#Add password before seeding the database
#default admin account
User.create([ :first_name => 'Garan', :last_name => 'Jones', :email => 'garan.jones@hpa.org.uk', :password => '*', :current_state => 'active'])
