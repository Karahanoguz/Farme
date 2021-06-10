class UsersController < ApplicationController
  def index
    @users = User.producer
    @markers = @users.geocoded.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        info_window: render_to_string(partial: "products/info_window", locals: { producer: producer })
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @markers = [@user].map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        info_window: render_to_string(partial: "products/info_window", locals: { producer: producer })
      }
    end
  end
end
