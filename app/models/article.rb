class Article < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: {minimum: 400}

end
