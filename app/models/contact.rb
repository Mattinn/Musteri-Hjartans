# encoding: utf-8
class Contact < ActiveRecord::Base
  attr_accessible :content, :email, :name, :phone, :title
end
