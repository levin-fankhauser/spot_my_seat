# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_admin!, only: [ :index, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update ]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Benutzer erfolgreich aktualisiert."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Benutzer erfolgreich gelöscht."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Zugriff verweigert." unless current_user.admin?
  end

  def authorize_user!
    redirect_to root_path, alert: "Zugriff verweigert." unless @user == current_user || current_user.admin?
  end
end
