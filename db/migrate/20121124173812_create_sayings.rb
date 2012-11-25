class CreateSayings < ActiveRecord::Migration
  def change
    create_table :sayings do |t|
      t.string :message

      t.timestamps
    end
  end
end
