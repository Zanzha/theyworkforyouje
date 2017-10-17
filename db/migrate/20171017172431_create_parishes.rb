class CreateParishes < ActiveRecord::Migration[5.1]
  def change
    create_table :parishes do |t|
      t.text :name

      t.timestamps
    end
  end
end
