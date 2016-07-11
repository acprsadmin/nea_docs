class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :body
      t.float :ordernum
      t.integer :level_id
      t.integer :imageset
      t.string :caption
      t.float :oldorder
      t.text :adminnotes
      t.integer :book
      t.integer :toc1
      t.integer :toc2
      t.integer :toc3
      t.integer :pagetype


      t.timestamps null: false
    end
  end
end
