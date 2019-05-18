class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path, notice:"タスクを作成しました!"
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "タスクを編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice:"タスクを削除しました!"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
