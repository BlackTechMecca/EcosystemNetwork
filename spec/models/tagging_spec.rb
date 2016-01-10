require 'rails_helper'

RSpec.describe Tagging, :type => :model do

	let(:tagging) {FactoryGirl.create(:tagging)}

	describe "tagging relationships" do 

		it "should belong to a tag" do 
			expect(tagging.tag).to be_a Tag
		end

		it "shold belong to a article" do 
			expect(tagging.article).to be_a Article
		end
	end
	
end
