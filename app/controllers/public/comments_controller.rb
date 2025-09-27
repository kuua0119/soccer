class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :reject_guest_user, only: [:create,:destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "コメントを投稿しました"
    else
      redirect_to post_path(@post), alert: "コメントを入力してください"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(@post), notice: "コメントを削除しました"
    else
      redirect_to post_path(@post), alert: "削除権限がありません"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
