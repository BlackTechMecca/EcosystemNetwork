class Activity < ActiveRecord::Base
  belongs_to :postable, :polymorphic => true
  delegate :preview, :path, :user, :poster_name, to: :postable

  def self.recent_activity(limit)
    Activity.last(limit)
  end

  def self.tagged(tag)
    posts = Tag.all_posts(tag)
    if posts
      posts.map(&:activity)
    end
  end
end
