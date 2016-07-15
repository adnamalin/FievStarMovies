require 'rails_helper'

feature "User can add a review" do
  let(:movie) {Movie.create!(title: "Straight Outta Compton", description: "Straight Outta Compton is a 2015 American biographical drama film that chronicles the rise and fall of the Compton, California hip hop music group N.W.A.", director: "Ice-T", release_date: "2015-08-14")}
  before(:each) do
    User.create!(username:"vi", password: "1234")
    visit '/'
    click_link "Login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  scenario 'user clicks on add review link and goes to review form page', js: false do
    visit movie_path(movie)
    click_link "Add Review"
    expect(page).to have_content "Add Review for #{movie.title}"
  end

  scenario "user can fill out new review form", js: false do
    visit movie_path(movie)
    click_link "Add Review"
    choose('5')
    click_button("Rate!")
    fill_in('review[title]', :with => 'Mock Review')
    fill_in('review[body]', :with => 'Some random words here')
    click_button('Write Review!')
    expect(page).to have_current_path movie_path(movie)
  end
end
