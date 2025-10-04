class Public::CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  before_action :reject_guest_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @communities = Community.where(is_hidden: false).includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    if @community.is_hidden? && !@community.community_users.exists?(user_id: current_user.id)
      redirect_to communities_path, alert: "このコミュニティは非公開です"
    end
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      # 作成者を自動でメンバーに含める
      CommunityUser.create(user: current_user, community: @community)
      redirect_to @community, notice: "コミュニティを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to @community, notice: "コミュニティを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_path, notice: "コミュニティを削除しました"
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def ensure_owner
    unless @community.user == current_user
      redirect_to communities_path, alert: "権限がありません"
    end
  end

  def community_params
    params.require(:community).permit(:club_id, :community_name, :introduction, :image)
  end
end
