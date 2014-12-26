class IdeaMembershipsController < ApplicationController
  def create
    idea = Idea.find(params[:id])
    current_user.join_idea(idea)
    redirect_to idea, notice: "You are now part of this idea"
  end

  def destroy
    idea = Idea.find(params[:id])
    current_user.leave_idea(idea)
    redirect_to root_path
  end
end
