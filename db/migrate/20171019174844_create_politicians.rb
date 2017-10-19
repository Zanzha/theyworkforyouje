class CreatePoliticians < ActiveRecord::Migration[5.1]
  def change
    create_table :politician do |t|
       t.integer :parish_id
       t.string :full_name
       t.string :first_name
       t.string :middle_name
       t.string :last_name
       t.string :title
       t.string :gender
       t.datetime :date_of_birth
       t.string :website_url
       t.string :facebook_url
     end

  end
end
