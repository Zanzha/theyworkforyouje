class AddPictureToPolitician < ActiveRecord::Migration[5.1]
  def change
    add_column :politician, :avatar, :string
  end
end