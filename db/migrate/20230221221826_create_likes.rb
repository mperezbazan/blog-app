class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end
    add_reference :likes, :posts, foreign_key: true
    add_reference :likes, :authors, foreign_key: true
    add_index :likes: :posts
    add_index :likes, :authors
  end
end
