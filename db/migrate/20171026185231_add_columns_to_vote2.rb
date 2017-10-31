class AddColumnsToVote2 < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :voting_id, :string
    add_column :votes, :voting_date, :datetime
  end
end
