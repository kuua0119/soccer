class AddClubIdToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :club, :string
  end
end
