class SessionsController < ApplicationController
  def new
  end

  def create
    if user_params[:password] == nil || user_params[:password].empty?
      redirect_to new_session_path
    else
      @user = User.find_by(name: user_params[:name])
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to welcome_path
      else
        redirect_to new_session_path
      end
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :password)
  end

end
