require 'rails_helper'

RSpec.describe Event, :type => :model do 
  let(:user) {FactoryGirl.create(:user, :first_name => "Sam", :last_name => "Smith")}
  let(:event) {FactoryGirl.create(:event, :name=>"Chi-hacknight",:description => "A place where stuff happens",:user=>user)}

  describe '#initialize' do 
    it '#initialize should set that proper characteristics' do 
      expect(event.name).to eq("Chi-hacknight")
      expect(event.description).to eq("A place where stuff happens")
      expect(event.user).to be_a User
    end

    it 'create an associated activity' do 
      expect(event.activity).to be_a Activity
    end
  end

  describe 'validations' do 
    it 'validates that it has a user' do 
      invalid_event = Event.create(name:"A presentation",description:"some some")
      expect(invalid_event).to_not be_valid
    end

    it 'validates that it has a name' do 
      invalid_event = Event.create(description:"something more",user:FactoryGirl.create(:user))
      expect(invalid_event).to_not be_valid
    end
  end

  describe "associations" do 
    it 'should be taggable' do
      tag1 = FactoryGirl.create(:tag)
      tag2 = FactoryGirl.create(:tag)
      event.tag(tag1, tag2)
      expect(event.tags.first).to eq(tag1)
    end
  end

  describe "::search" do
    it "returns all Events with a particular word in the name, description" do
      event_no_ruby = FactoryGirl.create(
        :event, 
        :name =>"Cool Event", 
        :description => "Work on interesting projects"
      )
      event_ruby_name = FactoryGirl.create(
        :event, 
        :name => "Rubyist Event!", 
        :description => "Talk about new gems"
      )
      event_ruby_description = FactoryGirl.create(
        :event, 
        :name => "Object-oriented programming", 
        :description => "Comparing approaches in Ruby, Java, and Python"
      )

      search_results = Event.search("ruby")
      expect(search_results).to include(event_ruby_name)
      expect(search_results).to include(event_ruby_description)
      expect(search_results).to_not include(event_no_ruby)
    end
  end
end


