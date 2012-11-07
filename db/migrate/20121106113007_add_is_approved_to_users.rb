class AddIsApprovedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_approved, :integer,  :default => 0
    add_column :users, :is_admin, :integer, :default => 0
  end
end
