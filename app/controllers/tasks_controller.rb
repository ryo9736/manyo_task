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
    if params[:task] && params.dig(:task,:search).nil?
      if params[:sort_expired]
        @tasks = Task.all.expired
      else
        @tasks = Task.all.recent
      end
    else
      if  params[:task] && params.dig(:task, :title).present? && params.dig(:task, :status).present?
        @tasks = Task.search_title(params).search_status(params)
      elsif params[:task] &&  params.dig(:task, :title).present? && params.dig(:task, :status).blank?
        @tasks = Task.search_title(params)
      elsif params[:task] &&  params.dig(:task, :title).blank? && params.dig(:task, :status).present?
        @tasks = Task.search_status(params)
      else
        @tasks = Task.all.recent
      end
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
    params.require(:task).permit(:title,:content,:sort_expired,:status,:search)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
