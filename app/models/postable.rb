module Postable

  def self.included(base)
    base.after_create :_create_activity
    base.belongs_to :user
    base.has_one :activity, 
            :as => :postable,
            :foreign_key => :postable_id
    base.has_many :taggings, as: :taggable
    base.has_many :tags, through: :taggings
    base.accepts_nested_attributes_for :tags, :update_only => true
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

  def path
    "#{self.class.table_name}/#{self.id}"
  end

  def poster_name
    user.full_name
  end

  def _create_activity
    Activity.create(
      :postable_id => self.id,
      :postable_type => self.class,
    )
  end

  def preview
    raise NotImplementedError
  end
end
