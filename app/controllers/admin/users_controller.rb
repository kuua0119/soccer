class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :destroy, :ban, :unban]
  
  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました"
  end

  def ban
    @user.update(is_banned: true)
    redirect_to admin_user_path(@user), notice: "ユーザーを凍結しました"
  end

  def unban
    @user.update(is_banned: false)
    redirect_to admin_user_path(@user), notice: "ユーザーの凍結を解除しました"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
