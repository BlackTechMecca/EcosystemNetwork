class Tag < ActiveRecord::Base
  has_many :taggings
  belongs_to :taggable, polymorphic: true
  has_many :articles, through: :taggings, source: :taggable, source_type: 'Article'
  has_many :job_posts, through: :taggings, source: :taggable, source_type: 'JobPost'
  has_many :events, through: :taggings, source: :taggable, source_type: 'Event'

  validates :name, presence: true, length: {minimum: 2 }

  def self.all_posts(name)
    job_posts = JobPost.includes(:tags).where("tags.name = ?", name).references(:tags)
    events = Event.includes(:tags).where("tags.name = ?", name).references(:rags)
    job_posts + events
  end
end
