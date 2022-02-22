class ActivitiesController < ApplicationController
  def create
    @activity = Activity.new(params["activity"])
    @activity.user_id = @current_user.id #set user_id in the database
    @activity.save
    redirect_to "/contacts/#{@activity.contact_id}"
  end
end
