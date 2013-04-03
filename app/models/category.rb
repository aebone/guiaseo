class Category < ActiveRecord::Base
  has_many :contents
  attr_accessible :name
end
