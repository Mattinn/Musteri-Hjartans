class AddTreatmentsUsersJoinTable < ActiveRecord::Migration
  def up
     create_table :treatments_users, :id => false do |t|
        t.integer :treatment_id
        t.integer :user_id
      end
  end

  def down
    drop_table :treatments_users
  end
end
