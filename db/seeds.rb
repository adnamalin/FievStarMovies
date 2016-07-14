# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

review = Review.new(title: "It was okay", body: "somebody", reviewer_id: 1)
review.movie = movie
review.save!

User.create!(username: "vi", password:"1234")
User.create!(username: "amanda", password:"1234")
User.create!(username: "susie", password:"1234")

review.ratings = [Rating.new(rater_id:1, rating: 5)]
review.ratings << Rating.new(rater_id:2, rating: 2)
review.ratings << Rating.new(rater_id:3, rating: 4)
movie.ratings = [Rating.new(rater_id:1, rating:5)]

review.comments = [Comment.new(commenter_id:1, comment: "she was so pretty"), Comment.new(commenter_id:2, comment: "that was a dumb commet"),Comment.new(commenter_id:3, comment: "stupid review"),Comment.new(commenter_id:1, comment: "your comment is dumb!")]
review.save!
movie.save!



<<<<<<< HEAD
=======
Movie.create(title: 'The Room', description: 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored of him and decides to seduce Johnny\'s best friend, Mark. From there, nothing will be the same again.', director: 'Tommy Wiseau', release_date: Date.new(2003,6,27) )

Movie.create(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
>>>>>>> 3c8ed6ba7fee9198ed674befc0f9b31a9c27bc95

Movie.create(title: "Legally Blonde", description: "Bend and snap", director: "Elle Woods", release_date: "2004-06-18")

Review.create(movie_id: 1)

Review.create(movie_id: 1)
<<<<<<< HEAD
=======

Rating.create(rating: 5, movie_id: 1)

Rating.create(rating: 5, movie_id: 1)

Rating.create(rating: 3, movie_id: 1)
>>>>>>> 3c8ed6ba7fee9198ed674befc0f9b31a9c27bc95
