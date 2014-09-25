class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  before_action :require_login

  protect_from_forgery with: :exception

  def authorize
    @hash = Digest::MD5.hexdigest(current_user.email)
    unless current_user && current_user.admin?
     redirect_to root_path, notice: "Page not Found"
      false
    end
  end
end
