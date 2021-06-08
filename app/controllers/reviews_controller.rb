class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
    @order = Order.find(params[:order_id])
    @review = Review.new(review_params)
    @review.order = @order
    @review.order_product = @order.order_products.first #otherwise it won't save
    if @review.save
      redirect_to product_path(@order.order_products.first.product)
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
