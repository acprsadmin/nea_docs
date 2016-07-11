class CreateFieldtypes < ActiveRecord::Migration
  def change
    create_table :fieldtypes do |t|

      t.timestamps null: false
    end
  end
end
