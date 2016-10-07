class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      UserMailer.activation_email(user).deliver
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def activate
    @user = User.find(params[:user_id])
    @user.activate! if params[:activation_code] == @user.activation_code
    redirect_to user_url(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
