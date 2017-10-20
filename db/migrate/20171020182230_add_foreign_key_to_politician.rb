class AddForeignKeyToPolitician < ActiveRecord::Migration[5.1]
  def change

    change_column :politician, :parish_id, :bigint
    add_foreign_key :politician, :parishes

  end
end