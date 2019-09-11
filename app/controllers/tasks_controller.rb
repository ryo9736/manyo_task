class TasksController < ApplicationController
  before_action :set_task,only: [:show,:edit,:update,:destroy]
  def new
    @task = Task.new
    @labels = Label.all
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
    if params[:sort_label].nil?
      if params[:search].nil?
        if params[:sort_expired]
          @tasks = @task.expired_sort
        elsif params[:sort_priority]
          @tasks = @task.priority_sort
        else
          @tasks = @task.recent
        end
      else
        if params[:status].present? && params[:title].present?
          @tasks = current_user.tasks.search_status(params[:status]).search_title(params[:title])
        elsif params[:status].blank? && params[:title].present?
          @tasks = current_user.tasks.search_title(params[:title])
        elsif params[:status].present? && params[:title].blank?
          @tasks = current_user.tasks.search_status(params[:status])
        else
          @tasks = @task.recent
        end
      end
    elsif params[:label_id].blank?
      redirect_to tasks_path
    else
      @tasks = Label.find(params[:label_id]).tasks.includes(:user).where(user_id: current_user.id).page(params[:page])
    end
      @tasks = @tasks.page(params[:page])
  end

  def show
  end

  def edit
    @labels = Label.all
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
    params.require(:task).permit(:title,:content,:expired,:status,:search,:priority,:label_id,label_ids: [])
  end

   def search_params
     params[:search]
   end

  def set_task
    @task = Task.find(params[:id])
  end

end
