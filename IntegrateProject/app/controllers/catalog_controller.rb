class CatalogController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @products = Product.all
    puts params.inspect
    @selected = Product.where("category=?",params[:category])
    end
end
