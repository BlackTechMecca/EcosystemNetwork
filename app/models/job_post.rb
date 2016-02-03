class JobPost < ActiveRecord::Base
  include Postable

  validates :user_id, :title, :description, :presence => true

  def preview
    "#{title} - #{description[0..15]}..."
  end

end

JobPost.import force: true
