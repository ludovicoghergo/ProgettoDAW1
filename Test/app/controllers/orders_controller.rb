class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def create
    @order = Order.create(quantity: @n_orders,user_id: params[:user_id],product_id: params[:product_id])
    @order.save
    dec_product_quantity

    redirect_back(fallback_location: root_path)
  end

  def buy_now
    @n_orders = 1
    return create
  end

  def buy_order
    @n_orders = params[:n_order]
    return create
  end

  def dec_product_quantity
    @product_bought = Product.find(params[:product_id])
    @product_bought.quantity = @product_bought.quantity - @n_orders
    @product_bought.save
  end
end
