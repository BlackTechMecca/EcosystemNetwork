class Article < ActiveRecord::Base

	has_many :comments
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings


	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: {minimum: 100}

	def tag(*tag_list)
		tag_list.each {|tag| Tagging.create(taggable_type:self.class,taggable_id:self.id,tag:tag)}
	end

end
