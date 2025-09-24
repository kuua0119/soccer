class RemoveImageFromCommunities < ActiveRecord::Migration[6.1]
  def change
    remove_column :communities, :image, :string
  end
end
