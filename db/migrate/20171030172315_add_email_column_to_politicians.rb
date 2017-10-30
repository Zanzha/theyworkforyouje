class AddEmailColumnToPoliticians < ActiveRecord::Migration[5.1]
  def change
    add_column :politicians, :email, :string
  end
end