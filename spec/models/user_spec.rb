describe User do
  let(:user) { User.create!(username:"vi", password: "1234") }
  let(:saved_user) { User.find_by(username:"vi") }

  describe "has attributes" do
    it "has a username" do
      expect(user.username).to eq saved_user.username
    end

    it "has a secure password" do
      expect(user.password).to_not eq saved_user.password
    end
  end

  describe "differentiates between trusted and non-trusted reviewers" do
    let(:review) { Review.new(title: "It was okay", body: "somebody") }
    let(:user) { User.create!(username: "vi", password:"1234") }

    before(:each) do
      review.movie = Movie.create!(title: 'The Room', description: 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored of him and decides to seduce Johnny\'s best friend, Mark. From there, nothing will be the same again.', director: 'Tommy Wiseau', release_date: Date.new(2003,6,27) )
      review.reviewer = user
      review.ratings = [Rating.new(rater_id:user.id, rating: 5)]
      review.ratings << Rating.new(rater_id:2, rating: 2)
      review.ratings << Rating.new(rater_id:3, rating: 4)
      review.movie_rating = Rating.new(rating:4)
      review.save!
    end

    it "gets the average rating of the review" do
      review.ratings = [Rating.new(rating:5, rater_id:1), Rating.new(rating:4, rater_id:2), Rating.new(rating:3, rater_id:3), Rating.new(rating:4, rater_id:4), Rating.new(rating:3, rater_id:5) ]
      review.save
      expect(user.average_review_rating).to eq 3.8
    end

    it "trusted_reviewer? returns true if average reviewer rating > 3" do
      review.ratings =[Rating.new(rating:5, rater_id:1), Rating.new(rating:4, rater_id:2), Rating.new(rating:3, rater_id:3), Rating.new(rating:4, rater_id:4), Rating.new(rating:3, rater_id:5) ]
      review.save
      expect(user.trusted_reviewer?).to eq true
    end
  end
end
