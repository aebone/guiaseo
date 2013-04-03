class Content < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :text, :category_id
end
