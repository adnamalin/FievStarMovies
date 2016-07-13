describe User do
  let(:review) { Review.new(movie_id: 1, reviewer_id:1) }
  let(:user) { User.create!(username:"vi", password: "1234") }
  let(:saved_user) { User.find_by(username:"vi") }

  it "has a username" do
    expect(user.username).to eq saved_user.username
  end

  it "has a secure password" do
    expect(user.password).to_not eq saved_user.password
  end

  describe "differentiates between trusted and non-trusted reviewers" do
    before do
      movie = Movie.create!(title: "Dumb & Dumber", description: "A very funny movie", director: "John Smith", release_date: "1992-11-18")

      review = Review.new(title: "It was okay", body: "somebody", reviewer_id: 1)
      review.movie = movie
      review.save!

      User.create!(username: "vi", password:"1234")
      User.create!(username: "amanda", password:"1234")
      User.create!(username: "susie", password:"1234")

      review.ratings = [Rating.new(rater_id:1, rating: 5)]
      review.ratings << Rating.new(rater_id:2, rating: 2)
      review.ratings << Rating.new(rater_id:3, rating: 4)
      movie.ratings = [Rating.new(rater_id:1, rating:5)]

      review.comments = [Comment.new(commenter_id:1, comment: "she was so pretty"), Comment.new(commenter_id:2, comment: "that was a dumb commet"),Comment.new(commenter_id:3, comment: "stupid review"),Comment.new(commenter_id:1, comment: "your comment is dumb!")]
      review.save!
      movie.save!
    end

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
