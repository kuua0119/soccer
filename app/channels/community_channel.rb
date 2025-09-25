class CommunityChannel < ApplicationCable::Channel
  def subscribed
    community = Community.find(params[:community_id])
    stream_for community
  end
end
