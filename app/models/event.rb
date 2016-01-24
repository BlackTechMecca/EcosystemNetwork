class Event < ActiveRecord::Base
  include Postable

  has_many :comments
  validates :user_id, :name, :description, :date, :presence => true

  def preview
    "#{name} - #{description[0..15]}... (posted by #{user.first_name})"
  end
end
