class News < ActiveRecord::Base
  attr_accessible :author, :body, :title
  
  validates :author, :presence => true
  validates :title,  :presence => true,
                     :length => { :minimum => 5 }
  validates :body,   :presence => true
end
