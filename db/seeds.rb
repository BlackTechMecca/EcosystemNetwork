# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
15.times do
  FactoryGirl.create(:job_post)
end

15.times do
  FactoryGirl.create(:event)
end

FactoryGirl.create(:tag, :name => "entrepreneurship")
FactoryGirl.create(:tag, :name => "development")
FactoryGirl.create(:tag, :name => "UI/UX")
FactoryGirl.create(:tag, :name => "backend")

test_user = FactoryGirl.build(:user, :email => "chrissie@gmail.com", :password => "password", :password_confirmation => "password")

test_user.save

  		State.create(state_cd: "AL", name: "Alabama")
  		State.create(state_cd: "AK", name: "Alaska")
  		State.create(state_cd: "AZ", name: "Arizona")
  		State.create(state_cd: "AR", name: "Arkansas")
  		State.create(state_cd: "CA", name: "California")
  		State.create(state_cd: "CO", name: "Colorado")
  		State.create(state_cd: "CT", name: "Connecticut")
		State.create(state_cd: "DE", name: "Delaware")
  		State.create(state_cd: "FL", name: "Florida")
  		State.create(state_cd: "GA", name: "Georgia")
  		State.create(state_cd: "HI", name: "Hawaii")
  		State.create(state_cd: "ID", name: "Idaho")
  		State.create(state_cd: "IL", name: "Illinois")
  		State.create(state_cd: "IN", name: "Indiana")
  		State.create(state_cd: "IA", name: "Iowa")
  		State.create(state_cd: "KS", name: "Kansas")
  		State.create(state_cd: "KY", name: "Kentucky")
  		State.create(state_cd: "LA", name: "Louisiana")
  		State.create(state_cd: "ME", name: "Maine")
  		State.create(state_cd: "MD", name: "Maryland")
  		State.create(state_cd: "MA", name: "Massachusetts")
  		State.create(state_cd: "MI", name: "Michigan")
  		State.create(state_cd: "MN", name: "Minnesota")
  		State.create(state_cd: "MS", name: "Mississippi")
  		State.create(state_cd: "MO", name: "Missouri")
  		State.create(state_cd: "MT", name: "Montana")
  		State.create(state_cd: "NE", name: "Nebraska")
  		State.create(state_cd: "NV", name: "Nevada")
  		State.create(state_cd: "NH", name: "New Hampshire")
  		State.create(state_cd: "NJ", name: "New Jersey")
  		State.create(state_cd: "NM", name: "New Mexico")
  		State.create(state_cd: "NY", name: "New York")
  		State.create(state_cd: "NC", name: "North Carolina")
  		State.create(state_cd: "ND", name: "North Dakota")
  		State.create(state_cd: "OH", name: "Ohio")
  		State.create(state_cd: "OK", name: "Oklahoma")
  		State.create(state_cd: "OR", name: "Oregon")
  		State.create(state_cd: "PA", name: "Pennsylvania")
  		State.create(state_cd: "RI", name: "Rhode Island")
  		State.create(state_cd: "SC", name: "South Carolina")
  		State.create(state_cd: "SD", name: "South Dakota")
  		State.create(state_cd: "TN", name: "Tennessee")
  		State.create(state_cd: "TX", name: "Texas")
  		State.create(state_cd: "UT", name: "Utah")
  		State.create(state_cd: "VT", name: "Vermont")
  		State.create(state_cd: "VA", name: "Virginia")
  		State.create(state_cd: "WA", name: "Washington")
  		State.create(state_cd: "WV", name: "West Virginia")
  		State.create(state_cd: "WI", name: "Wisconsin")
  		State.create(state_cd: "WY", name: "Wyoming")










