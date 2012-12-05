# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Category.create(:category => "Books")
Category.create(:category => "Games")
Category.create(:category => "Electronics")
Category.create(:category => "Sports")
Category.create(:category => "Home")
Category.create(:category => "Clothings")
Category.create(:category => "Movies")
Category.create(:category => "Music")
Category.create(:category => "Other")