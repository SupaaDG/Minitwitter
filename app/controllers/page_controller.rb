class PageController < ApplicationController
  def index
     if session[:user_id].nil?
       redirect_to home_path
  else
    redirect_to profile_path
  end
end
  def home
  end
end
