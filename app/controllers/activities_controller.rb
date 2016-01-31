class ActivitiesController < ApplicationController
  def index
    tag = params[:tag]
    if tag.present?
      @tag = tag
      @activities = Activity.tagged(tag)
    else
      @activities = Activity.recent_activity(10)
    end
  end
end
