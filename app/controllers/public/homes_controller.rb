class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      redirect_to user_registration_path and return
    end
    @popular_communities = ::Community.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(5)
  end

  def about
    
  end
end
