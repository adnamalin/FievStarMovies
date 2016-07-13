require "rails_helper"

feature "viewing all reviews per movie" do
  #let(:movie) { Movie.find(1) }

  context "when user clicks on single movie page" do
    scenario "the user should see the title of the movie" do
      movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

      visit '/movies/1/reviews'
      expect(page).to have_content movie.title
    end

    scenario "the user should see the reviews" do
      movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

      visit '/movies/1/reviews'
      expect(page).to have_content movie.reviews[0].title
    end

    scenario "the user should see the comments" do
      movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

      visit '/movies/1/reviews'
      expect(page).to have_content movie.reviews[0].comments[0].comment
    end
  end
end
