class News < ActiveRecord::Base
  acts_as_content_block
  belongs_to_category
  has_attachment :attachment
end
