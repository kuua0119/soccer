class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries
  has_many :direct_messages, dependent: :destroy

  scope :between, ->(user1_id, user2_id) {
    joins(:entries)
      .where(entries: { user_id: [user1_id, user2_id] })
      .group("rooms.id")
      .having("COUNT(entries.user_id) = 2")
  }
end
