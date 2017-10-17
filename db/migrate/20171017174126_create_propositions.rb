class CreatePropositions < ActiveRecord::Migration[5.1]
  def change
    create_table :propositions do |t|
      t.string :politician_id
      t.string :title
      t.datetime :proposition_date
      t.datetime :vote_date
      t.string :reference

      t.timestamps
    end
  end
end
