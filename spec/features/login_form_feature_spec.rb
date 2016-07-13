require 'rails_helper'

feature "User can log in" do
  before(:each) { User.create!(username:"vi", password:"12345678") }

  scenario 'user clicks login link and sees login' do
    visit '/'
    click_link "Login"
    expect(page).to have_content "Login"
  end

  scenario "user can go to the homepage, click log in, and enter credentials" do
    visit '/'
    click_link "Login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '12345678')
    click_button('Login')
    expect(page).to have_current_path root_path
  end
end
