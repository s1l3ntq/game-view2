class ChangeCommentColumnToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :user_id, :integer
    remove_column :comments, :username, :string
    add_column :comments, :game_id, :integer
  end


end
