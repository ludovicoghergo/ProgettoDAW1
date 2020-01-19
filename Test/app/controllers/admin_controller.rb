class AdminController < ApplicationController
  skip_before_action :authorized

  def product_manage
    @products = Product.all
  end

  def user_manage
    @users = User.all
  end

  def order_manage
    @orders = Order.all
  end

  def delete_user
    @eliminate = User.find(params[:id])
    @eliminate.destroy
    redirect_to '/admin/user'
  end


  def delete_product
    @eliminate = Product.find(params[:id])
    @eliminate.destroy
    redirect_to '/admin/product'
  end

  def delete_order
    @eliminate = Order.find(params[:id])
    @eliminate.destroy
    redirect_to '/admin/order'
  end

end
