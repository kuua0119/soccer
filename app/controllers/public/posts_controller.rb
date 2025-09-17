class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)  
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿を作成しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    unless current_user == @post.user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :image) 
  end
end
