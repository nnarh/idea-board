class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.join_group(group)
    UserMailer.group_join_email(current_user, group).deliver
    redirect_to group, notice: "You are now in the group"
  end

  def destroy
    group = Group.find(params[:id])
    current_user.leave_group(group)
    redirect_to root_path
  end
end
