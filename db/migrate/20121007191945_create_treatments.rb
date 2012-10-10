class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.text :description
      t.references :healers

      t.timestamps
    end
    add_index :treatments, :healers_id
  end
end
