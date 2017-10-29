class RenamePoliticianTable < ActiveRecord::Migration[5.1]
  def change
  rename_table :politician, :politicians
  end
end