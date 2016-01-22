class Article < ActiveRecord::Base
	include Postable

	has_many :comments
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings


	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: {minimum: 100}

	def tag(*tag_list)
		tag_list.each {|tag| Tagging.create(taggable_type:self.class,taggable_id:self.id,tag:tag)}
	end

	def preview
		"#{title} - #{body[0..100]} ... (posted by #{user.first_name})"
	end

end
