class CreateRequestlogs < ActiveRecord::Migration
  def change
    create_table :requestlogs do |t|
      t.integer :user_id
      t.string :reqaction
      t.integer :request_id
      t.integer :nea_decision

      t.timestamps null: false
    end
  end
end
