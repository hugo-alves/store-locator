class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if is_admin?
      @user = User.find(params[:id])
      if @user.destroy
        log_out
        @user.destroy
        redirect_to 'index'
      else
        redirect_to @user
      end
    else
      redirect_to 'index'
    end
  end

  def show
    if is_admin?
      redirect_to '/is-admin'
    end
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
