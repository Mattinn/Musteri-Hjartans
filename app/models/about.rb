# encoding: utf-8
class About < ActiveRecord::Base
  attr_accessible :content, :title
  attr_accessor :defult_msg
  
end
