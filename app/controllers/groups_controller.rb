class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to @group, notice: "Group has been created"
    else
      render :new
    end
  end

  private

  def group_params
    params.
      require(:group).
      permit(:name, :description)
  end
end
