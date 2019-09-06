class Admin::UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update,:destroy]
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
    @user.destroy
    flash[:info] = 'ユーザを削除しました'
    redirect_to admin_users_path
  end

private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end