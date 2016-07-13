require 'rails_helper'

describe "user model" do
  let(:user) { User.create!(username:"vi", password: "1234") }
  let(:saved_user) { User.find_by(username:"vi") }

  it "has a username" do
    expect(user.username).to eq saved_user.username
  end

  it "has a secure password" do
    expect(user.password).to_not eq saved_user.password
  end
end
