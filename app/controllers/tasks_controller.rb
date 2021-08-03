class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update]
  before_action :authenticate!, except: [:index]

  # GET all Tasks
  def index
      render json: current_user.tasks
  end

  # GET /Tasks/:id
  def show
    render json: @task
  end

  # POST /Tasks
  def create

    task = current_user.tasks.create(task_params)
    if task
      render json: @task, status: :created
    else
      render json: { error: "Unable to create Task" }, status: :bad_request
    end
  end

  # PUT /Tasks/:id
  def update
    some_file = params[:pdf]
    params = updating_task_params.except(:pdf)
    @task = current_user.tasks.find_by(id: params[:id])
    if @task
      @task.update(updating_task_params)
      @task.some_file.attach(some_file) if some_file.present? && !!@task
      render json: @task.as_json(root: false, methods: :some_file_url).except('updated_at')

    else
      render json: { error: "Unable to update Task" }, status: :bad_request
    end
  end

  def destroy_all
    current_user.tasks.where(id: params[:ids]).destroy_all
  end

  private

  def updating_task_params
    params.permit(:id, :title, :description, :priority, :due_date, :some_file)
  end

  def task_params
    params.require(:task).permit(:id, :title, :description, :priority, :due_date, :is_done)
  end

  def find_task
    @task = user.tasks.where(params[:id])
  end

  def user
    @user||= User.find_by(params[:user_id])
  end

end
