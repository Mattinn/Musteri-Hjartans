class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.belongs_to :category
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :treatments, :category_id
  end
end
