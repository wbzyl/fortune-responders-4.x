class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  # private

  #   def session_params
  #     params.require(:sessions).permit(:email, :password)
  #   end

end
