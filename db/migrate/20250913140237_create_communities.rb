class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :community_name, null: false
      t.text :introduction, null: false
    
      t.timestamps
    end
  end
end
