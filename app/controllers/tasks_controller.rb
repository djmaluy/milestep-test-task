class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :destroy]

  # GET all Tasks
  def index
    render json: user.tasks
  end

  # GET /Tasks/:id
  def show
    render json: @task
  end

  # POST /Tasks
  def create
    @task = user.tasks.build(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: { error: "Unable to create Task" }, status: :bad_request
    end
  end

  # PUT /Tasks/:id
  def update
    @task = user.tasks.find(params[:id])
    if @task
      @task.update(task_params)
      render json: { message: "Task sucessfully updated" }, status: :ok
    else
      render json: { error: "Unable to update Task" }, status: :bad_request
    end
  end

  # DELETE /Tasks/:id
  def destroy
    @task = user.tasks.find(params[:id])
    if @task
      @task.destroy
      render json: { message: "Task successfully deleted" }, status: :ok
    else
      render json: { error: "Unable to delete Task" }, status: :bad_request
    end
  end

  private

  def task_params
    params.require(:task).permit!
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def user
    @user ||= User.find(params[:user_id])
  end
end
