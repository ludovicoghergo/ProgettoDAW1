class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def create
    @order = Order.create(quantity: 1,user_id: params[:user_id],product_id: params[:product_id])
    @order.save

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
end
