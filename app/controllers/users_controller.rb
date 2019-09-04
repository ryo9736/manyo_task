class UsersController < ApplicationController
  before_action :set_user,only: [:show]
  before_action :user_identify, only:[:show]
  skip_before_action :login_required
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ユーザ作成に成功しました'
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = '作成に失敗しました'
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_identify
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

end
