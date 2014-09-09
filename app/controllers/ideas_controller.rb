class IdeasController < ApplicationController
  skip_before_action :require_login, only:[:show]

  def index
    @ideas = current_user.ideas
  end

  def new
    @group = Group.find(params[:group_id])
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      current_user.join_idea(@idea)
      @group = Group.find(params[:group_id])
      @idea.update(group: @group)

      redirect_to @idea
    else
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to @idea, notice: "Idea has been deleted"
  end
  private

  def idea_params
    params.
      require(:idea).
      permit(:title, :description)
  end
end
