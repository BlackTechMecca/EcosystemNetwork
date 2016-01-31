class JobPost < ActiveRecord::Base
  include Postable

  validates :user_id, :title, :description, :presence => true

  def preview
    "#{title} - #{description[0..15]}..."
  end
  
  def self.search(query)
    JobPost
      .where("title LIKE :query OR description LIKE :query", :query => "%#{query}%")
  end
end
