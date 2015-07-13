class Tag < ActiveRecord::Base
  has_many :taggings
	has_many :pics, through: :taggings
end
