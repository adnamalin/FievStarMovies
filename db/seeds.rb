# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

review = Review.new(title: "It was okay", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", reviewer_id: 1)
review.movie = movie

User.create!(username: "vi", password:"1234")
User.create!(username: "amanda", password:"1234")
User.create!(username: "susie", password:"1234")

review.ratings = [Rating.new(rater_id:1, rating: 5)]
review.ratings << Rating.new(rater_id:2, rating: 2)
review.ratings << Rating.new(rater_id:3, rating: 4)
movie.ratings = [Rating.new(rater_id:1, rating:5)]
review.movie_rating = movie.ratings[0]


review.comments = [Comment.new(commenter_id:1, comment: "she was so pretty"), Comment.new(commenter_id:2, comment: "that was a dumb comment"),Comment.new(commenter_id:3, comment: "stupid review"),Comment.new(commenter_id:1, comment: "your comment is dumb!")]
review.save!
movie.save!


Movie.create(title: 'The Room', description: 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored of him and decides to seduce Johnny\'s best friend, Mark. From there, nothing will be the same again.', director: 'Tommy Wiseau', release_date: Date.new(2003,6,27) )

review2 = Review.new(title: "I love the ending scene", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", reviewer_id: 2)

review2.movie = movie
rating = Rating.create(rater_id:2, rating:4)
review2.movie_rating = rating
review2.save!

Movie.create(title: "Legally Blonde", description: "Bend and snap", director: "Elle Woods", release_date: "2004-06-18")

Genre.create!(genre: "comedy")
Genre.create!(genre: "horror")
Genre.create!(genre: "drama")
Genre.create!(genre: "scifi")

Assignment.create!(movie_id: 1, genre_id: 1)

Assignment.create!(movie_id: 1, genre_id: 2)

Assignment.create!(movie_id: 2, genre_id: 2)

Assignment.create!(movie_id: 3, genre_id: 3)
