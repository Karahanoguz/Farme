class ProductsController < ApplicationController
  def index
    if params[:search].present?
      # @products = Product.where("name ILIKE?", "%#{params[:query]}")
      @products = Product.search_by_name(params[:search][:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new
  end
end
