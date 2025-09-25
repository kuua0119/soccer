class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
  @post = Post.find(params[:post_id])
  current_user.likes.create(post: @post)
    respond_to do |format|
      format.js
    end
  end

    def destroy
    @post = Post.find(params[:post_id])
    current_user.likes.find_by(post: @post)&.destroy
    respond_to do |format|
      format.js
    end
  end

  def index
    @liked_posts = current_user.liked_posts.includes(:user)
  end
end
