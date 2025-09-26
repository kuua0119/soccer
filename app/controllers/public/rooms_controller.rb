class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @room = Room.find(params[:id])
    unless @room.users.include?(current_user)
      redirect_to root_path, alert: "アクセス権がありません"
      return
    end
    @direct_messages = @room.direct_messages.includes(:user)
    @message = DirectMessage.new
  end

  def create
    user = User.find(params[:user_id])
    if current_user.following?(user) && user.following?(current_user)
      room = Room.between(current_user.id, user.id).first
      unless room
        room = Room.create
        room.entries.create(user: current_user)
        room.entries.create(user: user)
      end
      redirect_to room_path(room)
    else
        redirect_to user_path(user), alert: "相互フォローしているユーザーのみDM可能です"
    end
  end
end
