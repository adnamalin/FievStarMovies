# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(username: "vi", password:"1234")
user2 = User.create!(username: "amanda", password:"1234")
user3 = User.create!(username: "susie", password:"1234")
user4 = User.create!(username: "stephano", password:"1234")

api = Moviedbapi.new
api.seed_database

review = Review.new(title: "I expected more", body: "At first the band tries to calmly talk their way out of a sticky situation, but their negotiations fail. Now it's punks vs. skinheads in an all out game of cat and mouse. The drama begins intelligently with words but morbidly ends with slaughter. What are the stakes? There is an assortment of random human beings, but character development is anemic at best. Without that emotional connection, our desire to even give a care is severely diminished. Director Jeremy Saulnier relies on rising tension and it works for awhile. However after 60 minutes, the dialogue becomes less needed to further developments. Gore emerges as the story in the final third. Le carnage extraordinaire is the ultimate agenda for the day. People are sliced, diced and mutilated with guns, machetes and killer dogs. It's competently done I suppose, but it's not as terrifying as the intense standoff that came before it. It's exactly what I expected would happen and after Blue Ruin, I expect more from Mr. Saulnier")
review.movie = Movie.find(1)
review.reviewer = user1
rating = review.movie.ratings.new(rating:2, rater_id:user1.id)
review.movie_rating = rating
review.save!

review2 = Review.new(title: "A sad last chapter", body: "Dying a painfully slow death with one unfortunate chapter left to go, this increasingly ingratiating Hunger Games knock-off already begot Divergent and Insurgent but merely begets Redundant with its latest. Oh, Allegiant ups the action and intrigue quotient from its predecessor but leaves you wanting less--not another helping. Silly Dystopian politics give way to sillier Utopian politics. This series has always been about people not conforming to a forced stratum or phylum. It teases independent characters wanting to revolutionize and break free...yet they always end up in the same place. ")

review2.movie = Movie.find(1)
review2.reviewer = user2
rating = review2.movie.ratings.new(rating:1, rater_id:user2.id)
review2.movie_rating = rating
review2.save!
rating.save!

review3 = Review.new(title:"Cute and funny!", body: "Of all of the films about talking animals to date, this is one that I find myself being the most conflicted over. Following many different pets after their owners leave their houses and apartments, audiences get to see a funny take on what some pets may do during the day when nobody is home. Filled with adventure and a lot of fun moments for children, The Secret Life of Pets fails to grasp an audience older than the twelve to thirteen range. While the premise is clever, it has been done before, and strikingly so. In my very honest opinion, The Secret Life of Pets (although it does make some changes) is a blatant rip-off of 1996's Toy Story, as well as it's sequels. Voiced by Louis C.K., the main dog Max has his world turned upside down when his new owner brings home a new dog. Immediately becoming the alpa, Duke (the new dog, voiced by Eric Stonestreet) does his best to get rid of Max.")

review3.movie = Movie.find(2)
review3.reviewer = user1
rating = review3.movie.ratings.new(rating:4, rater_id:user1.id)
review3.movie_rating = rating
review3.save!
rating.save!

review4 = Review.new(title:"Pretty good", body:"Possibly the greatest marketing slogan ever (seriously, it's genius), Central Intelligence is an action/comedy film all about two former high school students saving the world by trying to find the 'Black Badger'...sounds ridiculous and pointless? That's because it is. Let's face it though, you probably were not going to see this film for its story. I can say however, there is an undeniably great chemistry between Johnson (who can do no wrong) and Hart (who I'm not the biggest fan of) which definitely makes this film watchable. Nice cameos from other prolific comedians but the main leads are the stars, and they succeed!")
review4.movie = Movie.find(2)
review4.reviewer = user3
rating = review4.movie.ratings.new(rating:4, rater_id:user3.id)
review4.movie_rating = rating
review4.save!
rating.save!

review5 = Review.new(title:"Gorgeous film!", body:"Despite some occasionally uneven pacing, this novel twist on the buddy/road trip genre provides lots of rollicking laughs and heartfelt moments, all of which are very deservedly earned. The carefully crafted chemistry of leads Sam Neill and Julian Dennison works from start to finish, thanks in large part to the film's skillful direction and deftly handled writing. Throw in some gorgeous cinematography and sprinklings of subtle but recognizable social commentary, and you've got a winning formula for one of the year's best independent comedies.")
review5.movie = Movie.find(2)
review5.reviewer = user4
rating = review5.movie.ratings.new(rating:5, rater_id:user4.id)
review5.movie_rating = rating
review5.save!
rating.save!

review.ratings.create!(rating:4, rater_id:user2.id)
review.ratings.create!(rating:3, rater_id:user3.id)
review.ratings.create!(rating:4, rater_id:user4.id)
review.ratings.create!(rating:2, rater_id:user3.id)
review2.ratings.create!(rating:5, rater_id:user2.id)
review2.ratings.create!(rating:5, rater_id:user3.id)
review2.ratings.create!(rating:4, rater_id:user3.id)
review3.ratings.create!(rating:4, rater_id:user4.id)
review4.ratings.create!(rating:3, rater_id:user3.id)
review4.ratings.create!(rating:4, rater_id:user3.id)
review5.ratings.create!(rating:2, rater_id:user2.id)
review5.ratings.create!(rating:1, rater_id:user4.id)
