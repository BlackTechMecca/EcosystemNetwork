class Tag < ActiveRecord::Base
	belongs_to :article

	validates :name, presence: true, length: {minimum: 2 }

end
