class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @job_posts = []
    else
      @job_posts = JobPost.search params[:q]
    end
  end

  def results

  end
end
