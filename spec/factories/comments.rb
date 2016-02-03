FactoryGirl.define do
  factory :comment do
  	user             { FactoryGirl.create(:user) }
  	body    	     { Faker::Lorem.sentence }
  	commentable_type {FactoryGirl.create}
  	# commentable_type { ["Article", "JobPost"].sample }
  	commentable_id   {1}
    
  end

end
