class TasksController < ApplicationController
  before_action :set_task,only: [:show,:edit,:update,:destroy]
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    redirect_to task_path(@task.id),notice: "タスクを作成しました"
    else
      render 'new'
    end
  end

  def index
    if params[:sort_expired]
      @tasks = Task.all.order(sort_expired: "DESC")
    else
      @tasks = Task.all.order(created_at: "DESC")
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:task_name,:content,:sort_expired)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
