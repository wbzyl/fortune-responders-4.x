class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(comment_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for registering!"
    else
      render "new"
    end
  end

private

  def comment_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
