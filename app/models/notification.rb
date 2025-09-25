class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :community
  belongs_to :community_message
end
