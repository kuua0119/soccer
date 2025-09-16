class Public::HomesController < ApplicationController
  def top
    @popular_communities = ::Community.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(5)
  end

  def about
    
  end
end
