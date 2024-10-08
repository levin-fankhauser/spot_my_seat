class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_admin!, only: [ :index, :edit ]
  before_action :authorize_user!, only: [ :edit, :update, :show ]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end

  def authorize_user!
    redirect_to root_path, alert: "Access denied!" unless @user == current_user || current_user.admin?
  end
end
