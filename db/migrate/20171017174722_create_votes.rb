class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :proposition_id
      t.string :type

      t.timestamps
    end
  end
end
