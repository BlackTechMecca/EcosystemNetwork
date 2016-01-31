require 'rails_helper'

RSpec.describe EventsController, :type => :controller do 

  login_user

  let(:valid_attributes) {
    { :name => "Super cool event",
      :description => "Event Description text",
      :date => Date.today,
    }
  }

  describe '#index' do 
    it 'displays all events' do 
      10.times {FactoryGirl.create(:event)}
      get :index

      expect(response.status).to be 200
      event_hits = assigns(:events)
      expect(event_hits.count).to eq(10)
    end

    context "search" do
      it "returns only events matching the query if given a search param" do
        ruby_event = FactoryGirl.create(:event, :name => "Ruby developer event", :user_id => subject.current_user.id)
        java_event = FactoryGirl.create(:event, :name => "Java developer event", :user_id => subject.current_user.id)

        get :index, {:search => "ruby" }
        expect(assigns(:events)).to eq([ruby_event])
      end

      it "populates the search field with the value of the search" do
        get :index, {:search => "ruby" }
        expect(assigns(:previous_search)).to eq("ruby")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let!(:tag_1) { FactoryGirl.create(:tag, :name => "Tag 1") }
      let!(:tag_2) { FactoryGirl.create(:tag, :name => "Tag 2") }
      let(:new_attributes) {
        { :name => "Updated Event Name",
          :description => "Updated event Description text",
          :date => Date.today,
          :tag_ids => [ tag_1.id, tag_2.id ]
        }
      }
  
      it "updates the requested event" do
        event = subject.current_user.events.create! valid_attributes
        put :update, {:id => event.to_param, :event => new_attributes}
        event.reload
        expect(event.name).to eq("Updated Event Name")
        expect(event.description).to eq("Updated event Description text")
      end
  
      it "assigns the requested event as @event" do
        event = subject.current_user.events.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}
        expect(assigns(:event)).to eq(event)
      end

      it "updates the requested event with tags" do
        event = subject.current_user.events.create! valid_attributes
        put :update, {:id => event.to_param, :event => new_attributes}
        event.reload

        expect(event.tags.count).to eq(2)
        expect(event.tags.first.name).to eq("Tag 1")
        expect(event.tags.last.name).to eq("Tag 2")
      end
  
      it "redirects to the event" do
        event = subject.current_user.events.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}
        expect(response).to redirect_to(event)
      end
    end
  end
end
