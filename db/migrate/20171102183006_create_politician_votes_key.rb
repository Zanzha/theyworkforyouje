class CreatePoliticianVotesKey < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :politician_id, :bigint

    add_foreign_key :votes, :politicians
  end
end
