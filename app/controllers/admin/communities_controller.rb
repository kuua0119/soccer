class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_community, only: [:show, :destroy, :hide, :unhide]

  def index
    @communities = Community.all.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @members = @community.users.includes(:community_users)
  end

  def destroy
    @community.destroy
    redirect_to admin_communities_path, notice: "コミュニティを削除しました"
  end

  def hide
    @community.update(is_hidden: true)
    redirect_to admin_communities_path(), notice: "コミュニティを非公開にしました"
  end

  def unhide
    @community.update(is_hidden: false)
    redirect_to admin_communities_path(), notice: "コミュニティを公開にしました"
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end
end
