# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username: "vi", password:"1234")
User.create!(username: "amanda", password:"1234")
User.create!(username: "susie", password:"1234")
User.create!(username: "stephano", password:"1234")

api = Moviedbapi.new
api.seed_database
