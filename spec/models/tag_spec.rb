require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) { FactoryGirl.create(:tag) }

  describe "#initialize" do 
    it 'should have a title' do 
      expect(tag.name).to be_a String
    end

    it 'should be linkable to many articles' do 
      article = FactoryGirl.create(:article)
      article2 = FactoryGirl.create(:article)
      article.tag(tag)
      article2.tag(tag)

      expect(tag.articles).to eq([article, article2])
    end

    it 'should be linkable to many events' do 
      event = FactoryGirl.create(:event)
      event2 = FactoryGirl.create(:event)
      event.tag(tag)
      event2.tag(tag)

      expect(tag.events).to eq([event, event2])
    end

    it 'should be linkable to many job_posts' do 
      job_post = FactoryGirl.create(:job_post)
      job_post2 = FactoryGirl.create(:job_post)
      job_post.tag(tag)
      job_post2.tag(tag)

      expect(tag.job_posts).to eq([job_post,job_post2])
    end
  end

  describe "::all_posts" do
    it "returns associated objects with a given tag" do
      tag = FactoryGirl.create(:tag, :name => "ruby")

      job_post = FactoryGirl.create(:job_post)
      job_post.tag(tag)

      event = FactoryGirl.create(:event)
      event.tag(tag)

      all_posts = Tag.all_posts("ruby")
      expect(all_posts.count).to eq(2)
      expect(all_posts).to include(job_post)
      expect(all_posts).to include(event)
    end

    it "returns an empty array if no tag exists with that name" do
      all_posts = Tag.all_posts("not-a-real-tag")
      expect(all_posts.count).to eq(0)
      expect(all_posts).to eq([])
    end

    it "returns an empty array if passed nil" do
      all_posts = Tag.all_posts(nil)
      expect(all_posts.count).to eq(0)
      expect(all_posts).to eq([])
    end
  end
end

