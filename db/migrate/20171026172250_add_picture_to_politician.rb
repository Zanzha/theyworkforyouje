class AddPictureToPolitician < ActiveRecord::Migration[5.1]
  def change
    add_column :politicians, :avatar, :string
  end
end