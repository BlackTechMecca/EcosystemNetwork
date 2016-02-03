class JobPost < ActiveRecord::Base
  include Postable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :comments, as: :commentable
  validates :user_id, :title, :description, :presence => true

  def preview
    "#{title} - #{description[0..15]}..."
  end

  def self.non_elastic_search(query)                                                                
    JobPost                                                                             
      .where("title LIKE :query OR description LIKE :query", :query => "%#{query}%")    
  end                                                                                   

  # def self.search
  #   defined within elasticsearch gem
  # end
end

# Index all article records from the DB to Elasticsearch
JobPost.import force: true
