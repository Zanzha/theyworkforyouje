class AlterPropsTable < ActiveRecord::Migration[5.1]
  def change

remove_column :propositions, :vote_date
remove_column :propositions, :reference

rename_column :propositions, :title, :prop_name
rename_column :propositions, :proposition_date, :prop_date

add_column :propositions, :lodged_by, :string
add_column :propositions, :debate_date, :string
add_column :propositions, :prop_pdf, :string
add_column :propositions, :minutes_pdf, :string
add_column :propositions, :hansard_pdf, :string
add_column :propositions, :vote_id, :string
add_column :propositions, :status, :string

  end
end
