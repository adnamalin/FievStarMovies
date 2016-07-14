require "rails_helper"

feature "viewing all reviews per movie" do
  let(:movie) { Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18") }

  before(:each) do
    user1 = User.create!(username: "vi", password:"1234")
    user2 = User.create!(username: "amanda", password:"1234")
    user3 = User.create!(username: "susie", password:"1234")

    review = Review.new(title: "It was okay", body: "somebody", reviewer_id: user1.id)
    review.movie = movie


    review.ratings = [Rating.new(rater_id:user1.id, rating: 5)]
    review.ratings << Rating.new(rater_id:user2.id, rating: 2)
    review.ratings << Rating.new(rater_id:user3.id, rating: 4)
    movie.ratings = [Rating.new(rater_id:user1.id, rating:5)]

    review.comments = [Comment.new(commenter_id:user1.id, comment: "she was so pretty"), Comment.new(commenter_id:user2.id, comment: "that was a dumb commet"),Comment.new(commenter_id:user3.id, comment: "stupid review"),Comment.new(commenter_id:user1.id, comment: "your comment is dumb!")]
    review.save!
    movie.save!
  end

  context "when user clicks on single movie page" do
    scenario "the user should see the title of the movie" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content movie.title
    end

    scenario "the user should see the reviews" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content movie.reviews[0].title
    end

    scenario "the user should see the comments" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content movie.reviews[0].comments[0].comment
    end
  end
end
