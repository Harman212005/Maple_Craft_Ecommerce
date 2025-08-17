class Admin::OrdersController < ApplicationController
  before_action :require_admin, only: [:index, :update]
  before_action :set_order, only: [:update]

  def index
    @orders = Order.includes(:user).order(created_at: :desc)
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Order updated successfully."
    else
      flash[:alert] = "Failed to update order: #{@order.errors.full_messages.join(", ")}"
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
