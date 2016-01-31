class JobPost < ActiveRecord::Base
  include Postable

  validates :user_id, :title, :description, :presence => true

  def preview
    "#{title} - #{description[0..15]}... (posted by #{user.first_name})"
  end
  
  def self.search(query_params)
    title = query_params[:title]
    tag = query_params[:tag]
    if title.present? && tag.present?
      JobPost
       .joins(:tags)
       .where("tags.name = ?", tag)
       .where("lower(job_posts.title) LIKE ?", "%#{title.downcase}%")
    elsif title.present?
      JobPost
      .where("lower(job_posts.title) LIKE ?", "%#{title.downcase}%")
    elsif tag.present?
      JobPost
      .joins(:tags)
      .where("tags.name = ?", tag)
    else
      JobPost.all
    end
  end
end
