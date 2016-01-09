require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) {FactoryGirl.create(:tag)}

  describe "#initialize" do 
  	it 'should have a title' do 
  		expect(tag.name).to be_a String
  	end

  	it 'should be linked to many articles' do 
  		article = FactoryGirl.create(:article)
  		article2 = FactoryGirl.create(:article)
  		article.tag([tag])
  		article2.tag([tag])
  		expect(tag.articles).to eq([article,article2])
  	end

  end
end
