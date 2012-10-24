class TestCreator < ActiveRecord::Base
  attr_accessible :name, :description
  attr_accessor :questions
  has_many :questions
  
  accepts_nested_attributes_for :questions, :allow_destroy => :true,
  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
end
