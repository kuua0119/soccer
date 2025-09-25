class Admin::CommunityMessagesController < ApplicationController
  belongs_to :user
  belongs_to :community
  has_many_attached :files

  after_create_commit -> {
    CommunityChannel.broadcast_to(community, render_message)
  }

  private

  def render_message
    ApplicationController.renderer.render(partial: "public/community_messages/message", locals: { message: self })
  end
end
