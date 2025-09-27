class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :destroy, :hide, :unhide]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def show 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  def hide
    @post.update(is_hidden: true)
    redirect_to admin_posts_path(), notice: "投稿を非公開にしました"
  end

  def unhide
    @post.update(is_hidden: false)
    redirect_to admin_posts_path(), notice: "投稿を公開にしました"
  end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end
end
