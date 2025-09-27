class AddIsHiddenToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :is_hidden, :boolean
    add_column :communities, :default, :false
  end
end
