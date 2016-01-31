require 'rails_helper'

RSpec.describe JobPost, :type => :model do
  let(:user) { FactoryGirl.create(:user, :first_name => "Jack", :last_name => "Test") }
  let(:job_post) do
    JobPost.create(:user => user,
      :title => "Software Engineer",
      :description => "Build great software"
    )
  end

  describe "#initialize" do
    it "has a title and description" do
      expect(job_post.title).to eq("Software Engineer")
      expect(job_post.description).to eq("Build great software")
    end

    it "belongs to a user" do
      expect(job_post.user).to be_a User 
      expect(job_post.user.first_name).to eq "Jack"
    end

    it "creates a an associated activity" do
      expect(job_post.activity).to be_an Activity
    end
  end

  describe "#preview" do
    it "displays the title and start of description" do
      expect(job_post.preview).to eq("Software Engineer - Build great soft... (posted by Jack)")
    end
  end

  describe "#path" do
    it "returns the path of the particular post" do
      expect(job_post.path).to eq("job_posts/1")
    end
  end

  describe "#poster_name" do
    it "returns the full name of the user who created it" do
      expect(job_post.poster_name).to eq("Jack Test")
    end
  end

  describe "validations" do
    it "validates that it is associated with a user" do
      invalid_post = JobPost.create(:title => "Employee wanted",
                                       :description => "To do stuff!")
      expect(invalid_post).to_not be_valid
    end

    it "validates that it has a title" do
      invalid_post = JobPost.create(:user => FactoryGirl.create(:user),
                                       :description => "To do stuff!")
      expect(invalid_post).to_not be_valid
    end

    it "validates that it has a description" do
      invalid_post = JobPost.create(:title => "Employee wanted",
                                       :user => FactoryGirl.create(:user))
      expect(invalid_post).to_not be_valid
    end
  end

  describe "associations" do 
    it 'should be taggable' do
      tag1 = FactoryGirl.create(:tag)
      tag2 = FactoryGirl.create(:tag)
      job_post.tag(tag1, tag2)
      expect(job_post.tags.first).to eq(tag1)
    end
  end

  describe "::search" do
    it "returns all JobPosts with a particular word in the title, description" do
      job_post_no_ruby = FactoryGirl.create(
        :job_post, 
        :title =>"Developer", 
        :description => "Work on interesting projects"
      )
      job_post_ruby_title = FactoryGirl.create(
        :job_post, 
        :title => "Senior Ruby Developer", 
        :description => "Team lead position at fast-paced company"
      )
      job_post_ruby_description = FactoryGirl.create(
        :job_post, 
        :title => "Senior Developer", 
        :description => "3+ years Ruby required"
      )

      search_results = JobPost.search("ruby")
      expect(search_results).to include(job_post_ruby_title)
      expect(search_results).to include(job_post_ruby_description)
      expect(search_results).to_not include(job_post_no_ruby)
    end
  end
end
