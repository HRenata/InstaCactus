class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
