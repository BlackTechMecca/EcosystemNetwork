require 'rails_helper'

RSpec.describe "article/index.html.erb", :type => :view do
  describe "article/index.html.erb" do 

  	before(:each) do 
  		assign(:articles,[FactoryGirl.create(:article,title:"Article 1")])
  	end

  	it "displays all the articles" do 
  		render
  		expect(rendered.match /Article 1/).to be_a MatchData
  	end

  end
end
