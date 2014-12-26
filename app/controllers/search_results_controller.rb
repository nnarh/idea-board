class SearchResultsController < ApplicationController
  skip_before_action :require_login, only: [:show]
  
  def show
    @query = params[:query]
    @ideas = Idea.search(@query)
  end
end
