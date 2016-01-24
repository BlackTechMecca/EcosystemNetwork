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

  describe "associations" do
    it "should have many comments" do 
      comment1 = FactoryGirl.create(:comment, article:article)
      comment2 = FactoryGirl.create(:comment, article:article)
      expect(article.comments).to eq([comment1, comment2])
    end

    it 'should have many tags' do 
      tag1 = FactoryGirl.create(:tag)
      tag2 = FactoryGirl.create(:tag)
      tagging1 = FactoryGirl.create(:tagging,
                                    taggable_type:article.class, 
                                    taggable_id: article.id, 
                                    tag:tag1)
      tagging2 = FactoryGirl.create(:tagging,
                                    taggable_type:article.class, 
                                    taggable_id: article.id, 
                                    tag:tag2)
      expect(article.tags).to eq([tag1,tag2])
    end

    it 'should be taggable' do
      tag1 = FactoryGirl.create(:tag)
      article.tag(tag1)
      expect(article.tags.first).to eq(tag1)
    end

    it "should have an activity" do
      expect(article.activity).to be_an Activity
    end
  end

  describe "functionality" do 
  end
end

