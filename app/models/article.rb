class Article < ActiveRecord::Base
  include Postable

  has_many :comments, as: :commentable
  validates :title, :presence => true

  def preview
    "#{title} - #{body[0..100]} ... (posted by #{user.first_name})"
  end
end
