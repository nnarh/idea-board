class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  before_action :require_login

  protect_from_forgery with: :exception

  def authorize
    unless current_user && current_user.admin?
     redirect_to root_path, notice: "Page not Found"
      false
    end
  end
end
