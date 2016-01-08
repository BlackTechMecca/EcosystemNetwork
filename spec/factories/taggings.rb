FactoryGirl.define do
  factory :tagging do

  	article {FactoryGirl.create(:article)}
  	tag  {FactoryGirl.create(:tag)} 
    
  end

end
