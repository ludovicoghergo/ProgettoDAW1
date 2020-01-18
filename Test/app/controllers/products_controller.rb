class ProductsController < ApplicationController
skip_before_action :authorized
before_action :auth_admin, only:[:new]
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
    @comments = Comment.where("product_id=?",params[:id])
  end
end
