class AddColumnsToVote3 < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :proposition_title, :string
  end
end
