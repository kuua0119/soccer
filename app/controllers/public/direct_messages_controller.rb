class Public::DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.direct_messages.new(message_params)
    if @message.save
      RoomChannel.broadcast_to(@message.room,render_to_string(partial: "public/direct_messages/direct_message", locals: { direct_message: @message }))
    else
      flash[:alert] = "メッセージを入力してください (140字以内)"
    end
    redirect_to request.referer
  end

  private

  def message_params
    params.require(:direct_message).permit(:content, :room_id, :image)
  end
end
