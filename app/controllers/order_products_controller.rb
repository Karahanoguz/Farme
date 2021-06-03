class OrderProductsController < ApplicationController
  def create
    user_id = current_user.id
    @order = Order.find_by(user_id: user_id, status: nil)
    @order = Order.create(user_id: current_user.id) if @order.nil?
    @order_product = OrderProduct.new
    @order_product.order = @order
    @order_product.product = Product.find(params[:product_id])
    @order_product.quantity = params[:order_product][:quantity]
    @order_product.save!
    redirect_to order_path(@order)
  end
end
# - When add product to your order:
# - On the products#show page you need a form to create a new OrderProduct instance where you can add the quantity
# - The OrderProduct instance takes the product id, the quantity and the order id to be created (order_products#create)
# - You get the order id by creating a new order when creating the order product OR by finding the existing order that is already created
# - You check if it exists by checking if the user has an order which has the status open
# - The order status by open
# Order.create(user_id: current_user, status: "open")
