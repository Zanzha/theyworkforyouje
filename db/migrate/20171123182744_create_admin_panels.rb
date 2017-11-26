class CreateAdminPanels < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_panels do |t|

      t.timestamps
    end
  end
end
