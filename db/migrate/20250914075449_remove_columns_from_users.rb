class RemoveColumnsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :address, :string
    remove_column :users, :telephone_number, :string
  end
end
