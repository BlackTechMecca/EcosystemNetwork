FactoryGirl.define do
  factory :comment do
  	user    { FactoryGirl.create(:user)}
  	body    { Faker::Lorem.sentence }
    
  end

end
