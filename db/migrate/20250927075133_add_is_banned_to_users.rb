class AddIsBannedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_banned, :boolean
    add_column :users, :default, :false
  end
end
