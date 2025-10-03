class Community < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :club, optional: true
  has_many :community_users, dependent: :destroy
  has_many :users, through: :community_users
  has_many :community_messages, dependent: :destroy
  has_one_attached :image
  has_many :notifications, dependent: :destroy

  validates :club_id, presence: { message: "を選択してください" }
  validates :community_name, presence: { message: "を入力してください" }
  validates :introduction, presence: { message: "を入力してください" }
end
