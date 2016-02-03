class Event < ActiveRecord::Base
  include Postable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :comments
  validates :user_id, :name, :description, :date, :presence => true

  def preview
    "#{name} - #{description[0..15]}..."
  end

  def self.non_elastic_search(query)
    Event                                                                                
      .where("name LIKE :query OR description LIKE :query", :query => "%#{query}%")      
  end
  
  # def self.search
  #   defined within elasticsearch gem
  # end
end

Event.import force: true
