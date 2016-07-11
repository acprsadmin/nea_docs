class CreateTabletypes < ActiveRecord::Migration
  def change
    create_table :tabletypes do |t|

      t.timestamps null: false
    end
  end
end
