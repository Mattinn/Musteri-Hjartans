class CreateTestCreators < ActiveRecord::Migration
  def change
    create_table :test_creators do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
