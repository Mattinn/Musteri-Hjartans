class CreatePersonalTests < ActiveRecord::Migration
  def change
    create_table :personal_tests do |t|
      t.string :name
      t.text :description
      t.float :result

      t.timestamps
    end
  end
end
