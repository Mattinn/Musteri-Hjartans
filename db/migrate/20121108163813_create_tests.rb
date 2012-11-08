class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.test :description
      t.float :result

      t.timestamps
    end
  end
end
