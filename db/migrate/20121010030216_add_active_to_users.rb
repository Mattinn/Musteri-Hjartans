class AddActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
  end
end
