class DefineFkeys < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role_id, :bigint
    add_foreign_key :users, :roles
  end
end
