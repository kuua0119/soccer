class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])   
    current_user.follow(user)
    redirect_to users_mypage_path
  end

  def destroy
    user = User.find(params[:user_id])
    relationship = current_user.active_relationships.find_by(followed_id: user.id)
    relationship.destroy if relationship
    redirect_to users_mypage_path
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render "public/relationships/following"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render "public/relationships/followers"
  end
end
