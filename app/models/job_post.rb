class JobPost < ActiveRecord::Base
  include Postable
  belongs_to :user
  has_one :activity, 
          :as => :postable,
          :foreign_key => :postable_id
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :tags, :update_only => true

  validates :user_id, :title, :description, :presence => true

  def poster_name
    user.full_name
  end

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
    "#{title} - #{description[0..15]}... (posted by #{user.first_name})"
  end
end
