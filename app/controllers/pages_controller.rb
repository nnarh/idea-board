class PagesController < ApplicationController
  skip_before_action :require_login
  def about

  end

  def privacy

  end

  def terms

  end
end
