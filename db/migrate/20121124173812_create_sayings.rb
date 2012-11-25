class CreateSayings < ActiveRecord::Migration
  def change
    create_table :sayings do |t|
      t.text :message

      t.timestamps
    end
  end
end
