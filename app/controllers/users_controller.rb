class UsersController < ApplicationController

  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :birthday, :photo)
  end
end
