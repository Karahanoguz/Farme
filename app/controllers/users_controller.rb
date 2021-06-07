class UsersController < ApplicationController
  def index
    @users = User.producer
  end

  def show
    @user = User.find(params[:id])
  end
end
