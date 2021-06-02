class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.where(name: params[:query])
    else
      @products = Product.all
    end
  def show
    @product = Product.find(params[:id])
  end
end
