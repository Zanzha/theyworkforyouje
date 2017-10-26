class AddColumnsToVote < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :member_position, :string
    add_column :votes, :member_name, :string

  end
end