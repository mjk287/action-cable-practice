class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = JWT.encode({user_id: @user.id}, "secret")
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
