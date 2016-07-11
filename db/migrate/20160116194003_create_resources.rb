class CreateResources < ActiveRecord::Migration
  def up
    create_table :resources do |t|
      t.string :submitter
      t.string :position
      t.string :orgname
      t.string :submitter_email
      t.string :submitter_phone
      t.string :mepi_project
      t.string :mepi_project_number
      t.boolean :focus_women
      t.boolean :focus_youth
      t.datetime :published_at
      t.integer :nid
      t.integer :number_pages
      t.string :doc_types
      t.integer :materialtype_id
      t.string :website
      t.string :partner_orgs
      t.string :presenter
      t.string :training_event
      t.datetime :event_date
      t.integer :language
      t.integer :tnid
      t.integer :organization_id
      t.integer :pid
      t.integer :pnid
      t.integer :tid
      t.integer :series_id
      t.integer :project_id
      t.boolean :is_featured


      t.timestamps null: false
    end
    Resource.create_translation_table! :title => :string, :body => :text
  end
  def down
    drop_table :resources
    Resource.drop_translation_table!
  end

end
