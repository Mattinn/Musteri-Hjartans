class CreateSpecialists < ActiveRecord::Migration
  def change
    create_table :specialists do |t|
      t.string :name
      t.string :cms_name
      t.string :title
      t.string :email
      t.string :phone
      t.integer :pnr

      t.timestamps
    end
  end
end
