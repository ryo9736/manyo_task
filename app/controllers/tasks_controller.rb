class TasksController < ApplicationController
  before_action :set_task,only: [:show,:edit,:update,:destroy]
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
    flash[:info] = 'タスクを作成しました'
    redirect_to task_path(@task.id)
    else
      render 'new'
    end
  end

  def index
    @task = current_user.tasks
    if params[:search].nil?
      if params[:sort_expired]
        @tasks = @task.expired_sort
      elsif params[:sort_priority]
        @tasks = @task.priority_sort
      else
        @tasks = @task.recent
      end
    else
      if  params[:task] && params.dig(:task, :title).present? && params.dig(:task, :status).present?
        @tasks = Task.search_title(params).search_status(params)
      elsif params[:task] && params.dig(:task, :title).present? && params.dig(:task, :status).blank?
        @tasks = Task.search_title(params)
      elsif params[:task] && params.dig(:task, :title).blank? && params.dig(:task, :status).present?
        @tasks = Task.search_status(params)
      else
        @tasks = @task.recent
      end
    end
    @tasks = @tasks.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクを更新しました'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:info] = 'タスクを削除しました'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title,:content,:expired,:status,:search,:priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
