class ApplicationController < ActionController::Base
  before_action :require_login

  protect_from_forgery with: :exception

  def current_user
    super || Guest.new
  end

  def authorize
    @hash = Digest::MD5.hexdigest(current_user.email)
    unless current_user && current_user.admin?
     redirect_to root_path, notice: "Page not Found"
      false
    end
  end
end
