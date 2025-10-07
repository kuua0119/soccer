class ChangeUserIdColumnsToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :user_id, true
    change_column_null :communities, :user_id, true
    change_column_null :comments, :user_id, true
    change_column_null :community_messages, :user_id, true
    change_column_null :community_users, :user_id, true
    change_column_null :likes, :user_id, true
    change_column_null :notifications, :user_id, true
    change_column_null :direct_messages, :user_id, true
    change_column_null :entries, :user_id, true
  end
end
