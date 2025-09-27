class AddIsHiddenToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_hidden, :boolean
    add_column :posts, :default, :false
  end
end
