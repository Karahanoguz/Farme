class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.where(location: params[:query])
    else
      @products = Product.all
    end
  end
end
