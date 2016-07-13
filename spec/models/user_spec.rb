describe User do
  let(:review) { Review.new(movie_id: 1, reviewer_id:1) }
  let(:user) { User.create!(username:"vi", password: "1234") }
  let(:saved_user) { User.find_by(username:"vi") }

  it "has a username" do
    expect(user.username).to eq saved_user.username
  end

  it "has a secure password" do
    expect(user.password).to_not eq saved_user.password

  describe "differentiates between trusted and non-trusted reviewers" do
    it "gets the average rating of the review" do
      review.ratings = [Rating.new(rating:5), Rating.new(rating:4), Rating.new(rating:3), Rating.new(rating:4), Rating.new(rating:3), ]
      review.save
      expect(User.find(1).average_review_rating).to eq 3.67
    end

    it "trusted_reviewer? returns true if average reviewer rating > 3" do
      review.ratings = [Rating.new(rating:5), Rating.new(rating:4), Rating.new(rating:3), Rating.new(rating:4), Rating.new(rating:3), ]
      review.save
      expect(User.find(1).trusted_reviewer?).to eq true
    end
  end
end
