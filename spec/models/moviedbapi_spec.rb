require 'rails_helper'

describe Moviedbapi do
  let(:api) { Moviedbapi.new }
  it "can make a request to the api" do
    expect(api.find_movie(505)).to be_a Movie
  end
end
