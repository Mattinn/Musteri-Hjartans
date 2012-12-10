class AddCategoryIdToAnsweredQuestion < ActiveRecord::Migration
  def change
    add_column :answered_questions, :category_id, :integer
  end
end
