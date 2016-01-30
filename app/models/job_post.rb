class JobPost < ActiveRecord::Base
  include Postable

  has_many :comments, as: :commentable
  validates :user_id, :title, :description, :presence => true

  def preview
    "#{title} - #{description[0..15]}... (posted by #{user.first_name})"
  end
end
