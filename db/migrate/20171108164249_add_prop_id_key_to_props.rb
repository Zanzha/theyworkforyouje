class AddPropIdKeyToProps < ActiveRecord::Migration[5.1]
  def change

    change_column :votes, :proposition_id, :bigint
    add_foreign_key :votes, :propositions

  end
end