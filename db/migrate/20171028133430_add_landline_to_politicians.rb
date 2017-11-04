class AddLandlineToPoliticians < ActiveRecord::Migration[5.1]
  def change
    add_column :politicians, :landline, :string
    change_column :politicians, :summary, :text
  end
end