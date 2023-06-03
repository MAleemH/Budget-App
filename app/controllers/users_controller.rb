class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful user creation
      redirect_to @user
    else
      # Handle validation errors
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
