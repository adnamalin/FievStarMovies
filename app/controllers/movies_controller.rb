class MoviesController < ApplicationController
  def index
    @genres = Genre.all.map { |gen| gen.genre}
    @movies = Movie.paginate(:page => params[:page], :per_page => 20)
    if params[:genre] != nil
      @movies = Genre.find_by(genre: params[:genre]).movies.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
    movie_finder
  end

private
  def movie_finder
    @movie = Movie.find(params[:id])
  end
end
