require "rails_helper"

feature "viewing all reviews per movie" do
  context "when user clicks on single movie page" do
    scenario "the user should see all the reviews for this movie" do
      visit '/movies/1/reviews'
      expect(page).to have_content 'Trusted Reviews Other Reviews Comments'
    end
  end
end
