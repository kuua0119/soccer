class Admin::ClubsController < ApplicationController
  before_action :set_club, only: [:edit, :update, :destroy]

  def index
    @clubs = Club.all.order(:id)
  end

  def edit
  end

  def update
    if @club.update(club_params)
      redirect_to admin_clubs_path, notice: "クラブ情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @club.destroy
    redirect_to admin_clubs_path, notice: "クラブを削除しました"
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :league, :country, :logo)
  end
end
