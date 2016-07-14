require "rails_helper"

feature "Adding comment feature" do
  let(:review) { Review.new(title: "It was okay", body: "somebody") }
  before(:each) do
    user = User.create!(username:"vi", password:"12345678")
    movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")
    review.reviewer = user
    review.movie = movie
    review.movie_rating = Rating.new(rating:5)
    review.save!

    visit '/'
    click_link "Login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '12345678')
    click_button('Login')
  end

  scenario "a logged in user can go to the comment form" do
    visit new_review_comment_path(review.id)
    expect(page).to have_content "Add Comment:"
  end

  scenario "a logged out user cannot go to the comment form" do
    visit '/'
    click_link "Logout"
    visit new_review_comment_path(review.id)
    expect(page).to have_current_path no_access_path
  end

  scenario "a logged in user can submit the comment form" do
    visit new_review_comment_path(review.id)
    fill_in('comment', with: "this review makes no sense")
    click_button("Add Comment!")
    expect(page).to have_current_path movies(review.movie.id)
  end
end
