class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end
    add_reference :comments, :authors, foreign_key: true
    add_reference :comments, :posts, foreign_key: true
    add_index :comments, :authors
    add_index :comments, :posts
  end
end
