class CatalogController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @products = Product.all
    @catg = Product.find(params[:id])
  end
end
