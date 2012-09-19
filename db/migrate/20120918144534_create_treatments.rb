class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.string :description
      t.references :specialists

      t.timestamps
    end
    add_index :treatments, :specialists_id
  end
end
