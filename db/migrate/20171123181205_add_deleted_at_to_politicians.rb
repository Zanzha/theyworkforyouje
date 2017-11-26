class AddDeletedAtToPoliticians < ActiveRecord::Migration[5.1]
  def change
    add_column :politicians, :deleted_at, :datetime
    add_index :politicians, :deleted_at
  end
end
