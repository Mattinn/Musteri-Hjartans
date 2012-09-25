class CreateNews < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "News", :group_name => "News")
    create_content_table :news, :prefix=>false do |t|
      t.string :name
      t.text :content, :size => (64.kilobytes + 1)
      t.text :description, :size => (64.kilobytes + 1)
      
      t.belongs_to :category

      t.timestamps
    end
  end
end
