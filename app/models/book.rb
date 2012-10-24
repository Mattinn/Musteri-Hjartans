class Book < ActiveRecord::Base
  attr_accessible :author, :link, :name, :tag
end
