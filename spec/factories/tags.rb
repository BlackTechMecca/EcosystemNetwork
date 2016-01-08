FactoryGirl.define do
  factory :tag do

  	taggings = %w(entrepreneurship development black-owned UI/UX design)

  	name {taggings.sample}
    
  end

end
