require 'rails_helper'

feature 'registering to the site' do
  scenario 'user clicks register link and can create a new account' do
    visit '/'
    click_link "Register"
    fill_in('Username', :with => 'John')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_submit
    expect(page).to have_content "John"
  end
end
