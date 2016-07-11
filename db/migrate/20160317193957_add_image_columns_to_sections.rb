class AddImageColumnsToSections < ActiveRecord::Migration
    def up
      add_attachment :sections, :image
    end

    def down
      remove_attachment :sections, :image
    end
end
