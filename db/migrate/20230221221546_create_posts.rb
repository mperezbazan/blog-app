class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end
  end
end
