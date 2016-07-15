class SearchesController < ApplicationController

  def new
  end

  def create
    api = Moviedbapi.new
    response = api.search_movie(search_params[:search_term])
    @all_results = collect_results(response)
    # redirect_to search_results_path
    render 'index', locals: {all_results: @all_results}
  end

  def index
  end

  def create_selected_result
  end

  private

  def search_params
    params.require(:search).permit(:search_term)
  end

  def collect_results(response)
    all_results = []
    response.each do |r|
      all_results << result = {title: r["title"], mdb_id: r["id"]}
    end
    all_results
  end

end
