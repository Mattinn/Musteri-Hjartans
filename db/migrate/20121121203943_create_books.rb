class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :isbn
      t.string :author

      t.timestamps
    end
  end
end
