require "rails_helper"

feature "viewing all reviews per movie" do
  context "when user clicks on single movie page" do
    scenario "the user should see the title of the movie" do
      visit '/movies/1/reviews'
      expect(page).to have_content Movie.find(1).title
    end

    scenario "the user should see the reviews" do
      visit '/movies/1/reviews'
      expect(page).to have_content Movie.find(1).reviews[0].title
    end
  end
end
