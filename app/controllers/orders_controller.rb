class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    raise
    @order = Order.new(order_params)
    @order.beer = @beer
    @order.user = current_user
    if @order.save
      redirect_to orders_path(@order)
    else
      render "beers/#{@beer.id}", status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end
end
