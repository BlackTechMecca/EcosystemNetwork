class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :articles, through: "taggings", source: "article"

	validates :name, presence: true, length: {minimum: 2 }

	

end
