class CreateImportPoliticians < ActiveRecord::Migration[5.1]
  def change
    create_table :import_politicians do |t|

      t.timestamps
    end
  end
end
