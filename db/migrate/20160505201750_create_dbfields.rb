class CreateDbfields < ActiveRecord::Migration
  def change
    create_table :dbfields do |t|
      t.string :name
      t.string :dbname
      t.text :description
      t.integer :fieldtype

      t.timestamps null: false
    end
  end
end
