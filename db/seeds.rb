# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.create(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

Movie.create(title: "Legally Blonde", description: "Bend and snap", director: "Elle Woods", release_date: "2004-06-18")

Review.create(rating: 3, movie_id: 1)

Review.create(rating: 5, movie_id: 1)
