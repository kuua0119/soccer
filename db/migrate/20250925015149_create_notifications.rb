class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.references :community_message, null: false, foreign_key: true
      t.boolean :read
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
