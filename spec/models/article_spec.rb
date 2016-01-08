require 'rails_helper'

RSpec.describe Article, :type => :model do

	let(:article) {FactoryGirl.create(:article)}
	let(:empty_article) {FactoryGirl.build(:article,title:nil,body:"asdfasdfasdfasdfasdf",img_url:nil)}

	describe "#initialize" do

		it "should have a title" do
			expect(article.title).to be_a String
			expect(empty_article.valid?).to be false
		end

		it 'should have a body' do 
			expect(article.body.length).to be >= 200
			expect(empty_article.valid?).to be false
		end

		it 'has an optional image tag' do
			expect(article.img_url).to be_a String
		end
	end
  
end

