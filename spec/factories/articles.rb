FactoryGirl.define do
  factory :article do

  	title   { Faker::Lorem.sentence }
  	body    { Faker::Lorem.paragraphs(4).join(" ") }
  	img_url { Faker::Avatar.image(Faker::Lorem.characters(10))}
  end

end
