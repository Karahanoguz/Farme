class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @products = Product.where("name ILIKE?", "%#{params[:query]}")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
