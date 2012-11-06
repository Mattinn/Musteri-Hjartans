class AddIsApprovedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_approved, :integer,  :default => 0
  end
end
