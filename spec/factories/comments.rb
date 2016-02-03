FactoryGirl.define do
  factory :comment do
  	transient do 
  		commentable nil
  	end
  	user             { FactoryGirl.create(:user) }
  	body    	     { Faker::Lorem.sentence }
  	commentable_type { commentable.class }
  	commentable_id  { commentable.id }
 
  end

end
