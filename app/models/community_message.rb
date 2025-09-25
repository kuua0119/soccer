class CommunityMessage < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many_attached :files
  validates :body, presence: true

  after_create_commit :create_notifications

private

  def create_notifications
    community.users.where.not(id: user_id).each do |member|
      Notification.create!(
        user: member,
        community: community,
        community_message: self
      )
    end
  end
end
