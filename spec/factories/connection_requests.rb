FactoryGirl.define do
  factory :connection_request do
    requester_id { FactoryGirl.create(:user).id }
    requestee_id { FactoryGirl.create(:user).id }
  end
end
