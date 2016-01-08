require 'rails_helper'

RSpec.describe Comment, :type => :model do
	let(:comment) {FactoryGirl.create(:comment)}
  	

  	describe "#initialize" do

	  	it "should have a user assoicated to it" do 
	  		expect(comment.user).to be_a User
	  	end

	  	it 'should have a body ' do 
	  		expect(comment.body).to be_a String
	  	end

  end
end
