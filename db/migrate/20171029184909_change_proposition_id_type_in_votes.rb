class ChangePropositionIdTypeInVotes < ActiveRecord::Migration[5.1]
  def change
  change_column :votes, :proposition_id, :string
  end
end