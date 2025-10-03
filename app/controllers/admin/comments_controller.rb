class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post
  before_action :set_comment, only: [:hide, :unhide]
  
  def hide
    @comment.update(is_hidden: true)
    redirect_to admin_post_path(@post), notice: "コメントを非公開にしました"
  end

  def unhide
    @comment.update(is_hidden: false)
    redirect_to admin_post_path(@post), notice: "コメントを公開に戻しました"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
