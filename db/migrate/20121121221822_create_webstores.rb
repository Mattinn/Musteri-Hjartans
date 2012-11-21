class CreateWebstores < ActiveRecord::Migration
  def change
    create_table :webstores do |t|
      t.string :title
      t.text :description
      t.string :phone
      t.string :address
      t.string :link

      t.timestamps
    end
  end
end
