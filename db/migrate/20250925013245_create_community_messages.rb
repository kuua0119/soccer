class CreateCommunityMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :community_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
