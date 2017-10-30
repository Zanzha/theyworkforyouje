class ChangeDateFormatInVotes < ActiveRecord::Migration[5.1]
  def change
   change_column :votes, :voting_date, :string
  end
end