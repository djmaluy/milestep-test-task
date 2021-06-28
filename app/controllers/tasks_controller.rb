class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update]

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

    task = user.tasks.create(task_params)
   
    if task
      render json: @task, status: :created
    else
      render json: { error: "Unable to create Task" }, status: :bad_request
    end
  end

  # PUT /Tasks/:id
  def update
    @task = user.tasks.find_by(id: params[:id])
    if @task
      @task.update(task_params)
      render json: { message: "Task sucessfully updated" }, status: :ok
    else
      render json: { error: "Unable to update Task" }, status: :bad_request
    end
  end

  def destroy_all
    user.tasks.where(id: params[:ids]).destroy_all
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :is_done)
  end

  def find_task
    @task = user.tasks.where(params[:id])
  end

  def user

     User.find_by(params[:user_id])
  end
end
