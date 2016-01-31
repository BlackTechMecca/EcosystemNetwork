class Event < ActiveRecord::Base
  include Postable

  has_many :comments
  validates :user_id, :name, :description, :date, :presence => true

  def preview
    "#{name} - #{description[0..15]}..."
  end

  def self.search(query)
    Event 
      .where("name LIKE :query OR description LIKE :query", :query => "%#{query}%")
  end
end
