# encoding: utf-8
class Book < ActiveRecord::Base
  attr_accessible :author, :category, :description, :isbn, :title
  
  validates_presence_of :title
  validates_presence_of :description
end
