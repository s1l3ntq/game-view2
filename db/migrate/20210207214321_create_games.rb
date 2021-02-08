class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :demo
      t.string :platform

      t.timestamps
    end
  end
end
