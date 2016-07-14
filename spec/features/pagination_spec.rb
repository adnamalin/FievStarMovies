require 'rails_helper'

feature 'user can click between pages' do
  before(:each) do
    100.times do
      Movie.create!(title: Faker::Lorem.sentence(3, true, 1), description: Faker::Hipster.sentence, director: Faker::Superhero.name, release_date: Faker::Date.backward(1400) )
    end
  end

  scenario 'user clicks on a page link and is taken to the specific page' do
    visit '/'
    click_link "2"

    expect(current_url).to eq "http://www.example.com/movies?page=2"
  end

  scenario 'user clicks on previous page link and is taken to the previous page' do
    visit '/'
    click_link "3"
    click_link "Previous"

    expect(current_url).to eq "http://www.example.com/movies?page=2"
  end

  scenario 'user clicks on next page link and is taken to the next page' do
    visit '/'
    click_link "Next"

    expect(current_url).to eq "http://www.example.com/movies?page=2"
  end
end

