require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  describe "tagging relationships" do 
    it "should belong to a tag" do 
      article = FactoryGirl.create(:article)
      tag = FactoryGirl.create(:tag)
      tagging = FactoryGirl.create(:tagging,
                                   :taggable_type => article.class,
                                   :taggable_id => article.id,
                                   :tag => tag
                                  )

      expect(tagging.tag).to be_a Tag
    end

    it "can link a tag to a job_post" do 
      job_post = FactoryGirl.create(:job_post)
      tag = FactoryGirl.create(:tag)
      tagging = FactoryGirl.create(:tagging,
                                   :taggable_type => job_post.class,
                                   :taggable_id => job_post.id,
                                   :tag => tag
                                  )

      expect(tagging.taggable).to be_a JobPost
    end

    it "can link a tag to an article" do 
      article = FactoryGirl.create(:article)
      tag = FactoryGirl.create(:tag)
      tagging = FactoryGirl.create(:tagging,
                                   :taggable_type => article.class,
                                   :taggable_id => article.id,
                                   :tag => tag
                                  )

      expect(tagging.taggable).to be_an Article
    end

    it "can link a tag to an event" do 
      event = FactoryGirl.create(:event)
      tag = FactoryGirl.create(:tag)
      tagging = FactoryGirl.create(:tagging,
                                   :taggable_type => event.class,
                                   :taggable_id => event.id,
                                   :tag => tag
                                  )

      expect(tagging.taggable).to be_an Event
    end
  end
end
