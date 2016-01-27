require 'rails_helper'

RSpec.describe ArticleController, :type => :controller do

	login_user # => what does this do? (AC)
	describe "#index" do
		it "renders the index template properly" do
			get :index
			expect(response.status).to render_template "index"
			expect(response.status).to be 200 
		end 
	end


	let(:user) {FactoryGirl.create(:user)}
	let(:valid_attributes) {FactoryGirl.create(:article,user:user)}

	describe "PUT" do 
		
	end

end
