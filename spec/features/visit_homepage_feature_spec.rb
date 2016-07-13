require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees website name" do
    visit "/"

    expect(page).to have_content 'FievStarMovies'
  end

  scenario "user sees login and register links" do
    visit "/"
    expect(page).to have_link("Login")
    expect(page).to have_link("Register")
  end
end
