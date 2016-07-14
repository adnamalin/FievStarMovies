require 'rails_helper'

feature "User can log in" do
  before(:each) { User.create!(username:"vi", password:"12345678") }
  let(:movie) {Movie.create!(title: "Straight Outta Compton", description: "Straight Outta Compton is a 2015 American biographical drama film that chronicles the rise and fall of the Compton, California hip hop music group N.W.A.", director: "Ice-T", release_date: "2015-08-14")}

  scenario 'user clicks on add review link and goes to review form page' do
    visit movie_path(movie)
    click_link "Add Review"
    expect(page).to have_content "Add Review for #{movie.title}"
  end

  scenario "user can fill out new review form" do
    visit movie_path(movie)
    click_link "Add Review"
    fill_in('review[title]', :with => 'Mock Review')
    fill_in('review[title]', :with => 'Mock Review')
    fill_in('review[body]', :with => 'Some random words here')
    click_button('Add Review!')
    expect(page).to have_current_path movie_path(movie)
  end

   xscenario "user can go to the homepage, click logout" do
    visit '/'
    click_link "Login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '12345678')
    click_button('Login')
    click_link "Logout"
    expect(page).to have_link 'Register'
  end
end
