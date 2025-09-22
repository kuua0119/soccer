class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]   # user, post, community
    @keyword = params[:keyword]

    case @model
    when "user"
      @results = User.where("name LIKE ?", "%#{@keyword}%")
    when "post"
      @results = Post.where("title LIKE ? OR body LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
    when "community"
      @results = Community.where("name LIKE ?", "%#{@keyword}%")   # 👈 名前だけ
    else
      @results = []
    end
  end
end
