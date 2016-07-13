# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie = Movie.create!(title: "The Titanic")
review = Review.new(title: "It was okay", body: "somebody", reviewer_id: 1)
review.movie = movie
review.save!

User.create!(username: "vi")
User.create!(username: "amanda")
User.create!(username: "susie")

review.ratings = [Rating.new(rater_id:1, rating: 5)]
review.ratings << Rating.new(rater_id:2, rating: 2)
review.ratings << Rating.new(rater_id:3, rating: 4)
movie.ratings = [Rating.new(rater_id:1, rating:5)]
review.save!
movie.save!
