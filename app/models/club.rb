class Club < ApplicationRecord
  has_many :communities
  has_one_attached :logo
  validates :name, presence: true, uniqueness: true
end
