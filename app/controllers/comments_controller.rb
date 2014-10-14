class CommentsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @idea.comments.create(comment_params)
    redirect_to idea_path(@idea)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
