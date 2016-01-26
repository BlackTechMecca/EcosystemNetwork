require 'rails_helper'

RSpec.describe "users/show.html.erb", :type => :view do
  describe "The user home page" do 

  	before(:each) do 
  		assign(:user, FactoryGirl.create(:user,first_name:"Andrew"))
  	end

  	it "should have a form to create an article" do 
  		render
  		expect(rendered).to match(/Andrew/)
  	end



  end



end
