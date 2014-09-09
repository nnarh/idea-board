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
    @group.users = User.where(id: user_ids)

    if @group.save
      redirect_to @group, notice: "Group has been created"
    else
      render :new
    end
  end

  def destroy
    Group.find(params[:id]).destroy

    redirect_to groups_path, notice: "Group has been deleted"
  end

  private

  def group_params
    params.
      require(:group).
      permit(:name, :description)
  end

  def user_ids
    params[:group][:users].select(&:present?)
  end
end
