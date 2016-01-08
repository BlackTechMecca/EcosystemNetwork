class Article < ActiveRecord::Base

	has_many :comments

	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: {minimum: 400}

end
