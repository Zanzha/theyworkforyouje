class RemoveColumnsFromTerms < ActiveRecord::Migration[5.1]
  def change
    rename_column :terms, :parishid, :parish_id
    add_column :terms, :politician_id, :integer
    add_column :terms, :office_id, :integer
    add_column :terms, :begin_date, :datetime
    add_column :terms, :end_date, :datetime
    remove_column :terms, :title
    remove_column :terms, :first_name
    remove_column :terms, :middle_name
    remove_column :terms, :last_name
    remove_column :terms, :gender
    remove_column :terms, :date_of_birth
    remove_column :terms, :website_url
    remove_column :terms, :facebook_url

  end
end
