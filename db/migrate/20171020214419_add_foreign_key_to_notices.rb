class AddForeignKeyToNotices < ActiveRecord::Migration[5.1]
  def change

    change_column :notices, :user_id, :bigint
    add_foreign_key :notices, :users

  end
end