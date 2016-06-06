class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tag1
      t.string :tag2
      t.string :author

      t.timestamps null: false
    end
  end
end
