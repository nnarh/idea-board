class IdeasController < ApplicationController
  skip_before_action :require_login, only:[:show]

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      redirect_to @idea
    else
      render :new
    end
  end

  private

  def idea_params
    params.
      require(:idea).
      permit(:title, :description)
  end
end
