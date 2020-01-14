class ProductsController < ApplicationController
  def index
    @products = Product.all
  end


  def new
  end
  def create
    @product = Product.new(params.require(:product).permit(:title,:category,:description, :price, :quantity))
    @product.save
    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end
end
