class Admin::OrdersController < ApplicationController
  before_action :require_admin, only: [:index, :update]
  before_action :set_order, only: [:update]

  def index
    @orders = Order.includes(:user).order(created_at: :desc)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: "Order updated successfully."
    else
      render :edit
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
