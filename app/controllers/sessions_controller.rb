class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )
    if user
      login(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def destroy
    logout(current_user)
    redirect_to bands_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
