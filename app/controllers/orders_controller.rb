class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @item = FoodItem.find(params[:food_item_id])
    @orders = @item.orders.all
  end

  def show
  end

  def new
    @item = FoodItem.find(params[:food_item_id])
    @order = Order.new(food_item: @item) #@item.orders.build
  end

  def create
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build order_params

    if @order.save
      redirect_to menu_path, flash: {success: "Thank you for your order. "}
    else
      render 'new'
    end
  end

  def destroy
    @order.destroy
  end

  def set_order
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :phone_number, :address, :quantity, :coupon_code)
  end
end
