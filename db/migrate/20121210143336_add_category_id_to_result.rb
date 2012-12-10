class AddCategoryIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :category_id, :integer
  end
end
