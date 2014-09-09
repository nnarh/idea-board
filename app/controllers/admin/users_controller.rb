class Admin::UsersController < AdminController

  def index
    @users = Users.all
  end
end
