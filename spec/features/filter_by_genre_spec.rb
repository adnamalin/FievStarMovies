require 'rails_helper'

feature "filters by genre" do
  let(:movie) { Movie.create(title: "Star Trek", director: "Susie", description: "Space!", release_date: "1960-08-13") }
  let(:genre) { Genre.create(genre: "comedy")}
  let(:assignment) { Assignment.create(genre_id: 1, movie_id: 1)}

  scenario "filters for comedy movies" do
    visit "/"
    click_button("Filter")
    expect(page).to_not have_text "(Comedy)"
  end

end
