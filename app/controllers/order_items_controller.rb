# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order
  before_action :set_order_item, only: %i[update destroy]
  before_action :authorize_user
  after_action :save_order

  def create
    OrderItem.add_item_to_cart(@order, params[:item_id])
    redirect_to cart_path, notice: "Item added"
  end

  def update
    @order_item.update(order_item_params)
    redirect_back fallback_location: cart_path, notice: "Item updated"
  end

  def destroy
    @order_item.destroy
    redirect_back fallback_location: cart_path, alert: "Item removed from cart"
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity)
    end

    def set_current_order
      @order = current_order
    end

    def set_order_item
      @order_item = @order.order_items.find(params[:id])
    end

    def authorize_user
      authorize @order
    end

    def save_order
      @order.save
    end
end
