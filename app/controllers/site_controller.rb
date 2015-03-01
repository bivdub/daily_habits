class SiteController < ApplicationController

  def index
    if @current_user
       redirect_to login_path
    end
  end

  def about
  end

end