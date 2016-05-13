class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(allowed_params[:email])

    if UserAuthenticator.new(user).authenticate(allowed_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You are logged in."
    else
      redirect_to root_path, alert: "Something went wrong trying to log in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logout with successfully."
  end


  private
  def allowed_params
    params.require(:user).permit([:email, :password])
  end
end
