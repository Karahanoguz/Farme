class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    else
      render 'orders/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to order_path(@review.order)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
