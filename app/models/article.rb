require 'pry'

class Article < ActiveRecord::Base

	has_many :comments
	has_many :taggings
	has_many :tags, through: "taggings", :source => "tag"

	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: {minimum: 100}

	def tag(tag_list)
		tag_list.each {|tag| Tagging.create(article:self,tag:tag)}
	end

end
