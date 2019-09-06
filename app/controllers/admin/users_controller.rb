class Admin::UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update,:destroy]
  before_action :require_admin,only: [:index,:new,]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを作成しました'
      redirect_to admin_user_path(@user.id)
    else
      flash.now[:danger] = '作成に失敗しました'
      render :new
    end
  end

  def show
  end

  def index
    @users = User.all

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザーを更新しました'
      redirect_to admin_users_path
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    if  User.where(admin: true).count == 1 && @user.admin?
      flash[:danger] = '管理者はあなたしかいません'
      redirect_to admin_users_path
    elsif User.where(admin: true).count > 1 && current_user.id == @user.id
      @user.destroy
      flash[:success] = '削除に成功しました'
      redirect_to new_session_path
    else
      @user.destroy
      flash[:success] = '削除に成功しました'
      redirect_to admin_users_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end