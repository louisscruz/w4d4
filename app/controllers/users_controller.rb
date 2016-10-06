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
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
