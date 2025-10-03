class ChangeUserForeignKeysToNullify < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :posts, :users
    add_foreign_key :posts, :users, on_delete: :nullify

    remove_foreign_key :communities, :users
    add_foreign_key :communities, :users, on_delete: :nullify

    remove_foreign_key :comments, :users
    add_foreign_key :comments, :users, on_delete: :nullify

    remove_foreign_key :community_messages, :users
    add_foreign_key :community_messages, :users, on_delete: :nullify

    remove_foreign_key :community_users, :users
    add_foreign_key :community_users, :users, on_delete: :nullify

    remove_foreign_key :likes, :users
    add_foreign_key :likes, :users, on_delete: :nullify

    remove_foreign_key :notifications, :users
    add_foreign_key :notifications, :users, on_delete: :nullify

    remove_foreign_key :direct_messages, :users
    add_foreign_key :direct_messages, :users, on_delete: :nullify

    remove_foreign_key :entries, :users
    add_foreign_key :entries, :users, on_delete: :nullify
  end
end
