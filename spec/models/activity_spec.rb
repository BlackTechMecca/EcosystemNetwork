require 'rails_helper'

RSpec.describe Activity, :type => :model do
  describe "#path" do
    it "renders the correct path based on the model of the postable" do
      job_post = FactoryGirl.create(:job_post)
      activity = job_post.activity

      expect(activity.path).to eq("job_posts/1")
    end
  end

  describe "::tagged" do
    it "returns all Activity referencing a post with a given tag" do
      ruby_tagged_job_post = FactoryGirl.create(:job_post)
      ruby_tagged_event = FactoryGirl.create(:event)

      untagged_job_post = FactoryGirl.create(:job_post)

      tag = FactoryGirl.create(:tag, :name => "ruby")
      ruby_tagged_event.tag(tag)
      ruby_tagged_job_post.tag(tag)

      expect(Activity.tagged("ruby")).to include(ruby_tagged_job_post.activity)
      expect(Activity.tagged("ruby")).to include(ruby_tagged_event.activity)
      expect(Activity.tagged("ruby")).to_not include(untagged_job_post)
    end
  end

  def login(user)
    post login_path, :login => user.login, :password => 'password'
  end
end

