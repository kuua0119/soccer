class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end
end
