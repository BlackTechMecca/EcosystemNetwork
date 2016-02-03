class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @job_posts = []
      @events = []
    else
      @job_posts = JobPost.search params[:q]
      @events = Event.search params[:q]
    end
  end
end
