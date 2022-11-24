class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Created successfully'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Creation aborted'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if task.update(task_params)
      flash[:success] = 'Updated successfully'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Update aborted'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task deleted successfully'
      redirect_to tasks_path
    else
      flash[:failure] = 'Something went wrong'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
