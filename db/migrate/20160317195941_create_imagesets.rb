class CreateImagesets < ActiveRecord::Migration
  def change
    create_table :imagesets do |t|

      t.timestamps null: false
    end
  end
end
