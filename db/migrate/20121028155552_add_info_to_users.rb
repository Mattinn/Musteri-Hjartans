class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :integer
    add_column :users, :postal, :integer
  end
end
