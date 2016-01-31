require 'rails_helper'

RSpec.describe ArticleController, :type => :controller do

  describe "#index" do
    it "renders the index template properly" do
      get :index
      expect(response.status).to render_template "index"
      expect(response.status).to be 200 
    end 
  end

end
