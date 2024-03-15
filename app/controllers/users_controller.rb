class UsersController < ApplicationController
  before_action :set_user, [:show, :update, :destroy, :posts]
  #before_action :authenticate_request, only: [:index, :show, :update, :destroy]

  def index
    users = User.all

    render json: users, status: 200
  end

  def show
    render json: UserBlueprint.render(@user, view: normal), status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: nil, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def posts_index
    user = User.find[:user_id]
    user_posts = user.posts

    render json: user_posts, status: :okay
  end

  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def user_params
    #permit only allows the parameters included in the argument
    params.permit(:username, :email, :first_name, :last_name)
  end
end
