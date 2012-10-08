class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
