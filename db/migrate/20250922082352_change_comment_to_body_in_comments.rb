class ChangeCommentToBodyInComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :comment, :text, null: false
    rename_column :comments, :comment, :body
  end
end
