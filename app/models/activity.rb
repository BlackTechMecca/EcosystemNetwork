class Activity < ActiveRecord::Base
  belongs_to :postable, :polymorphic => true

  def preview
    self.postable.preview
  end

  def path_to_postable
    self.postable.path
  end

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
