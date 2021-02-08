class AdcCommentIdtoGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :comment_id, :integer
  end
end
