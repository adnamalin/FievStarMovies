# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.create(title: 'The Room', description: 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored of him and decides to seduce Johnny\'s best friend, Mark. From there, nothing will be the same again.', director: 'Tommy Wiseau', release_date: Date.new(2003,6,27) )

Movie.create(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

Movie.create(title: "Legally Blonde", description: "Bend and snap", director: "Elle Woods", release_date: "2004-06-18")

Review.create(movie_id: 1)

Review.create(movie_id: 1)

Rating.create(rating: 5, movie_id: 1)

Rating.create(rating: 5, movie_id: 1)

Rating.create(rating: 3, movie_id: 1)
