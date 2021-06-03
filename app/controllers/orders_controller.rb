class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  # def create
  #   @order = Order.new
  #   @order.user_id = current_user.id
  #   @order.order_product = @order_product
  #   if @order.save
  #     redirect_to order_path(@order)
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end
end
