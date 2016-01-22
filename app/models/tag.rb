class Tag < ActiveRecord::Base

	has_many :taggings
	belongs_to :taggable, polymorphic: true

	validates :name, presence: true, length: {minimum: 2 }

end
