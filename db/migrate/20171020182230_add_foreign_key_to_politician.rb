class AddForeignKeyToPolitician < ActiveRecord::Migration[5.1]
  def change

    change_column :politicians, :parish_id, :bigint
    add_foreign_key :politicians, :parishes

  end
end