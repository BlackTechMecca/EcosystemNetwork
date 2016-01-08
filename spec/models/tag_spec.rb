require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) {FactoryGirl.create(:tag)}

  describe "#initialize" do 
  	it 'should have a title' do 
  		expect(tag.name).to be_a String
  	end
  end
end
