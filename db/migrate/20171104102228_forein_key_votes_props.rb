class ForeinKeyVotesProps < ActiveRecord::Migration[5.1]
  def change

   rename_column :propositions, :vote_id, :voting_id
    add_column :propositions, :vote_id, :bigint
    add_foreign_key :propositions, :votes

  end
end