class Public::HomesController < ApplicationController
  def top
    @popular_communities = ::Community.order(created_at: :desc).limit(3)
    @posts = Post.includes(:user).order(created_at: :desc).limit(6)
  end

  def about
    
  end
end
