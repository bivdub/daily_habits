class SiteController < ApplicationController


  def index
    if @current_user
       render 'user/show'
    end
  end

  def about
  end

end