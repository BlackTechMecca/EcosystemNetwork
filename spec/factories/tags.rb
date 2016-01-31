FactoryGirl.define do
  factory :tag do
  	taggings = %w(entrepreneurship development black-owned UI/UX design)
  	name {taggings.sample}

    transient do
      taggable nil
    end

    after(:create) do |tag, factory|
      if factory.taggable
        FactoryGirl.create(
          :tagging,
          :taggable_type => factory.taggable.class, 
          :taggable_id => factory.taggable.id,
          :tag_id => tag.id
        )
      end
    end
  end
end
