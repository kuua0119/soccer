class Community < ApplicationRecord
  belongs_to :user
  belongs_to :club 
  has_many :community_users, dependent: :destroy
  has_many :users, through: :community_users
  has_one_attached :image
end
