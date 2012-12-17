# encoding: utf-8
class Category < ActiveRecord::Base
  # Categories for treatments
  attr_accessible :name, :description
  has_many :treatments, :dependent => :destroy
  has_many :questions
  has_many :answered_questions
  
  validates_presence_of :name, :description
end
