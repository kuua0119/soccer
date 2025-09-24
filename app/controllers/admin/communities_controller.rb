class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @communities = Community.all.includes(:user)
  end

  def show
    @community = Community.find(params[:id])
    @members = @community.users.includes(:community_users)
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to admin_communities_path, notice: "コミュニティを削除しました"
  end
end
