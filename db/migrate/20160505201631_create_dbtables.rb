class CreateDbtables < ActiveRecord::Migration
  def change
    create_table :dbtables do |t|
      t.string :name
      t.string :dbname
      t.text :description
      t.integer :tabletype

      t.timestamps null: false
    end
  end
end
