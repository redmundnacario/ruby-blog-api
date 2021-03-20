class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :tags, array: true, default: []
      t.integer :likes
      t.integer :shares

      t.timestamps
    end
  end
end
