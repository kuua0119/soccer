class DirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 140 }
end
