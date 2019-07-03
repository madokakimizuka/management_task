class Admin::UsersController < ApplicationController
  before_action :admin_required
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render 'new'
    end
  end

  def show
    @tasks = @user.tasks.all
  end

  def index
    @users = User.all.includes(:tasks)
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました"
    else
      redirect_to admin_users_path, notice: "管理者がいなくなるので削除できません"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def admin_required
      redirect_to user_path(current_user.id), notice: '管理者しかアクセスできません' unless current_user.admin?
  end

end
