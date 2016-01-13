FactoryGirl.define do
  factory :user_connection do
    user_1_id { FactoryGirl.create(:user).id }
    user_2_id { FactoryGirl.create(:user).id }
  end
end
