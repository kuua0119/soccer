class Admin::CommunityUsersController < ApplicationController
  before_action :set_community

  def destroy
    member = @community.users.find(params[:id])

    if member == @community.user
      redirect_to admin_community_path(@community), alert: "作成者は退会させられません"
    else
      @community.users.destroy(member)
      redirect_to admin_community_path(@community), notice: "#{member.name} を退会させました"
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
