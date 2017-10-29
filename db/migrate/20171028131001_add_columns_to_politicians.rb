class AddColumnsToPoliticians < ActiveRecord::Migration[5.1]
  def change

    remove_column :politicians, :gender
    remove_column :politicians, :date_of_birth
    remove_column :politicians, :website_url
    remove_column :politicians, :facebook_url

    add_column :politicians, :summary, :string
    add_column :politicians, :address, :string
    add_column :politicians, :mobile, :string
    add_column :politicians, :fax, :string
    add_column :politicians, :parish, :string

  end
end