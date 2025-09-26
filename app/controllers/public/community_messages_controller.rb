class Public::CommunityMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community
  before_action :ensure_member!

  def index
    @messages = @community.community_messages.includes(:user).order(created_at: :asc)
    @message = CommunityMessage.new
  end

  def create
    @message = @community.community_messages.build(message_params)
    @message.user = current_user
    @message.created_at = Time.current
    if @message.save
      redirect_to community_community_messages_path(@community)
    else
      @messages = @community.community_messages.includes(:user).order(created_at: :asc)
      render :index
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def ensure_member!
    unless @community.users.include?(current_user)
      redirect_to communities_path, alert: "このコミュニティのメンバーのみ利用できます"
    end
  end

  def message_params
    params.require(:community_message).permit(:body, files: [])
  end
end
