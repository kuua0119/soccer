class RemoveMainClubFromCommunities < ActiveRecord::Migration[6.1]
  def change
    remove_column :communities, :main_club, :string
  end
end
