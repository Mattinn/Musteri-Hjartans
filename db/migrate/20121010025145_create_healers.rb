class CreateHealers < ActiveRecord::Migration
  def change
    create_table :healers do |t|
      t.string :name
      t.integer :postal_code
      t.references :user
      t.references :treatments

      t.timestamps
    end
    add_index :healers, :user_id
    add_index :healers, :treatments_id
  end
end
