class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    @table = Table.find(params[:table_id])
    @order = @table.orgers.build(order_params)
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end


  private

    def order_params
      params.require(:order).permit(:name, :email, :table_id)
    end
end
