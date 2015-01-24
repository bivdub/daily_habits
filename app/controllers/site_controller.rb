class SiteController < ApplicationController

  def index
    if @current_user
      redirect_to user_path
    end
  end

  def about
  end

end