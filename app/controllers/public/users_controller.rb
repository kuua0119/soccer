class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  before_action :reject_guest_user, only: [:edit,:update, :destroy]

  def show
    @user = User.find(params[:id])
    @communities = @user.communities
  end

  def mypage
    @user = current_user
    @communities = @user.communities
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    reset_session  
    redirect_to root_path, notice: "アカウントを削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_current_user
    redirect_to root_path, alert: "他のユーザーのプロフィールは編集できません" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :avatar, :introduction)
  end
end
