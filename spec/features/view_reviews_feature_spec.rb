require "rails_helper"

feature "viewing all reviews per movie" do
  before(:each) do
    movie = Movie.create!(title: "The Titanic")
    review = Review.new(title: "It was okay", body: "somebody", reviewer_id: 1)
    review.movie = movie
    review.save!

    User.create!(username: "vi")
  end

  context "when user clicks on single movie page" do
    scenario "the user should see the title of the movie" do
      visit '/movies/1/reviews'
      expect(page).to have_content Movie.find(1).title
    end

    scenario "the user should the reviews" do
      visit '/movies/1/reviews'
      expect(page).to have_content Movie.find(1).reviews
    end
  end
end
