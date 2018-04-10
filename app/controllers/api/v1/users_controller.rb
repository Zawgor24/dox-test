class Api::V1::UsersController < ApplicationController
  def index
    respond_with User.all, class: serializer
  end

  def show
    respond_with User.find(params[:id]), class: serializer
  end

  def create
    respond_with User.create(user_params), class: serializer
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    respond_with user, class: serializer
  end

  def destroy
    respond_with User.find(params[:id]).destroy
  end

  private

  def user_params
    params.permit(:name, :email, :age)
  end

  def serializer
    Api::V1::SerializableUser
  end
end