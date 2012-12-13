# encoding: utf-8
class Book < ActiveRecord::Base
  attr_accessible :author, :category, :description, :isbn, :title
end
