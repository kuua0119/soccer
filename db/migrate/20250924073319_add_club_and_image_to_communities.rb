class AddClubAndImageToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :main_club, :string, null: false
    add_column :communities, :image, :string
  end
end
