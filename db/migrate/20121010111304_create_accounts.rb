class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user_id
      t.string :healer_id

      t.timestamps
    end
  end
end