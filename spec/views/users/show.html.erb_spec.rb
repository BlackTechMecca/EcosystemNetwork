require 'rails_helper'

RSpec.describe "users/show.html.erb", :type => :view do
  describe "The user home page" do 

  	before(:each) do 
  		assign(:user, FactoryGirl.create(:user,first_name:"Andrew"))
  	end

  	it "should display the users name" do 
  		render
  		expect(rendered).to match(/Andrew/)
  	end

  	it 'should contain a form to submit an article' do 
  		render
  		expect(rendered).to match(/submit an article/i)
  	end
  end
end