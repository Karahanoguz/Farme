class ProductsController < ApplicationController
  def index
    if params[:search].present?
      # @products = Product.where("name ILIKE?", "%#{params[:query]}")
      @products = Product.search_by_name_and_location(params[:search][:query])
    else
      @products = Product.all
    end
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: { product: product })
      }
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new
  end
end
