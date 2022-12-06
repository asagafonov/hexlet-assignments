class TasksController < ApplicationController
  def index
    @tasks = Task.by_creation_date_desc
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find params[:id]
  end

  def create
    @task = Task.new(task_params)
    user = User.find(user_params[:user_id])
    status = Status.find(status_params[:status_id])
    @task.user = user
    @task.status = status

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find params[:id]
    user = User.find(user_params[:user_id])
    status = Status.find(status_params[:status_id])
    @task.user = user
    @task.status = status

    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find params[:id]

    @task.destroy

    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user, :status)
  end

  def user_params
    params.require(:task).permit(:user_id)
  end

  def status_params
    params.require(:task).permit(:status_id)
  end
end
