class CatalogController < ApplicationController
skip_before_action :authorized
  def index
    @products = Product.all
  end
  def show
    @products = Product.all
    @selected = Product.where("category=?",params[:category])
  end
end
