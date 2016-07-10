class UsersController < ApplicationController
  # before_filter :authorize, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to register_path
    end
end

  def destroy
    @user.destroy
    redirect_to root_path
  end
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

  def show
    redirect_to login_path unless current_user
    @user = current_user
    @tweets = @user.tweets.all
  end

end
