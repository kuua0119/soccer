class Public::CommunityUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community

  def create
    unless @community.users.include?(current_user)
      @community.users << current_user
      redirect_to @community, notice: "コミュニティに参加しました"
    else
      redirect_to @community, alert: "すでに参加しています"
    end
  end

  def destroy
    if @community.user == current_user
      redirect_to @community, alert: "作成者は退会できません"
    else
      @community.users.destroy(current_user)
      redirect_to @community, notice: "コミュニティを退会しました"
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
