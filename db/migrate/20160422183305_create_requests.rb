class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

      t.string :oldcode
      t.integer :acprsrole

      t.integer :origin
      t.integer :creator_id
      t.string :requestor
      t.string :requestor_email
      t.string :subject
      t.integer :requesttype
      t.boolean :urgent
      t.text :description
      t.text :pillar_response
      t.integer :impact_hour
      t.boolean :modernize
      t.string :impact_duration
      t.string :impact_schedule


      t.date :submitted_on
      t.integer :submitter_id
      t.date :responded_on
      t.integer :responder_id


      t.integer :nea_decision
      t.date :decided_on
      t.integer :decided_by
      t.text :decisiontext
      t.text :conditions


      t.date :developed_on
      t.date :tested_on
      t.date :deployed_on




      t.timestamps null: false
    end
  end
end
