class Webstore < ActiveRecord::Base
  attr_accessible :address, :description, :link, :phone, :title
end
