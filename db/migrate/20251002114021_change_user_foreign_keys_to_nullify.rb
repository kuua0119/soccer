class ChangeUserForeignKeysToNullify < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :users, on_delete: :nullify unless foreign_key_exists?(:posts, :users)
    add_foreign_key :communities, :users, on_delete: :nullify unless foreign_key_exists?(:communities, :users)
    add_foreign_key :comments, :users, on_delete: :nullify unless foreign_key_exists?(:comments, :users)
    add_foreign_key :community_messages, :users, on_delete: :nullify unless foreign_key_exists?(:community_messages, :users)
    add_foreign_key :community_users, :users, on_delete: :nullify unless foreign_key_exists?(:community_users, :users)
    add_foreign_key :likes, :users, on_delete: :nullify unless foreign_key_exists?(:likes, :users)
    add_foreign_key :notifications, :users, on_delete: :nullify unless foreign_key_exists?(:notifications, :users)
    add_foreign_key :direct_messages, :users, on_delete: :nullify unless foreign_key_exists?(:direct_messages, :users)
    add_foreign_key :entries, :users, on_delete: :nullify unless foreign_key_exists?(:entries, :users)
  end
end
