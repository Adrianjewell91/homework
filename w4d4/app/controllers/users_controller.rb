class UsersController < ApplicationController
  before_action :require_current_user!, except: [:new,:create]
  def index
    @user = User.all

    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end

  end

  def new
    @user = User.new

    render :new
  end

  def show
    @user = User.find_by(id: params[:id])

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
