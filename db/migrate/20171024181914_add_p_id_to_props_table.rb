class AddPIdToPropsTable < ActiveRecord::Migration[5.1]
  def change

add_column :propositions, :p_id, :string
  end
end
