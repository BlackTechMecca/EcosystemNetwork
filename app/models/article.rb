class Article < ActiveRecord::Base
  include Postable
  belongs_to :user
  has_one :activity, 
          :as => :postable,
          :foreign_key => :postable_id
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :comments


  validates :title, presence: true, length: { minimum: 6}
  validates :body, presence: true, length: {minimum: 100}

  def tag(*tag_list)
    tag_list.each do |tag| 
      Tagging.create(
        :taggable_type => self.class,
        :taggable_id => self.id,
        :tag => tag
      )
    end
  end

  def preview
    "#{title} - #{body[0..100]} ... (posted by #{user.first_name})"
  end
end
