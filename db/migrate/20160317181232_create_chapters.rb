class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :body
      t.float :ordernum
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
