class AddCategoryToResults < ActiveRecord::Migration
  def change
    add_column :results, :category, :string
  end
end
