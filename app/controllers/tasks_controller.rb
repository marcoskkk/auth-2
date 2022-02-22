class TasksController < ApplicationController
  def index
    @tasks = Task.where({ user_id: @current_user.id }) #only tasks that the user created / Need to associate a task witha user in the controller
    @task = Task.new
  end

  def create
    @task = Task.new(params["task"])
    @task.user_id = @current_user.id #set user_id in the database
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find(params["id"])
    @task.destroy
    redirect_to "/tasks"
  end
end
