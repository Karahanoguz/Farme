class OrdersController < ApplicationController
  def index
    user_id = current_user.id
    @orders = Order.where(user_id: user_id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "paid"
    @order.save
    redirect_to order_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end
end
