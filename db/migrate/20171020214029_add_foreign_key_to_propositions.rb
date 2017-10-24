class AddForeignKeyToPropositions < ActiveRecord::Migration[5.1]
  def change

    change_column :propositions, :politician_id, :bigint
    add_foreign_key :propositions, :politician

  end
end