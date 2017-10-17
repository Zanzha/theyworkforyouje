class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.integer :parishid
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.datetime :date_of_birth
      t.string :website_url
      t.string :facebook_url

      t.timestamps
    end
  end
end
