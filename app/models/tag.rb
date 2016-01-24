class Tag < ActiveRecord::Base
	has_many :taggings
	belongs_to :taggable, polymorphic: true
    has_many :articles, through: :taggings, source: :taggable, source_type: 'Article'
    has_many :job_posts, through: :taggings, source: :taggable, source_type: 'JobPost'
    has_many :events, through: :taggings, source: :taggable, source_type: 'Event'

	validates :name, presence: true, length: {minimum: 2 }
    
end
