FactoryGirl.define do
  factory :comment do
  	user    { FactoryGirl.create(:user) }
  	body    { Faker::Lorem.sentence }
  	article { FactoryGirl.create(:article) }
    
  end

end
