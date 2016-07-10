class TweetsController < ApplicationController
before_action :check_auth
before_action :set_user, only: [:new,:create]
  def index
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = @user.id
    if @tweet.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_tweet_path
    end
  end
  def update
    if @tweet.update_attributes(tweet_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  def destroy
    @var = Tweet.find(params[:id])
    @var.destroy
    redirect_to profile_path
  end

  def feed
    @tweets =Tweet.all
  end

  def show
  end

  private
def check_auth
  redirect_to root_path unless current_user
end

  def set_user
    @user = User.find(params[:user_id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
