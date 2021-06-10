class ProductsController < ApplicationController
  def index
    if params[:search].present?
      # @products = Product.where("name ILIKE?", "%#{params[:query]}")
      @products = Product.search_by_name_and_location(params[:search][:query])
    else
      @products = Product.all
    end
    @producers = User.where(products: @products)
    @markers = @producers.geocoded.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { producer: producer })
      }
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new
    @review = Review.new
    @user = @product.user
  end

  # def product_params
  #   params.require(:article).permit(:title, :body, photos: [])
  # end
end
