class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  add_flash_types :success, :warning, :danger, :info

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
    @order.total_price_calc

    if @order.save
      redirect_to food_item_order_path(id: @order.id)
      flash[:success] = "Thank you for your order."
    else
      render 'new'
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to food_item_orders_path, info: "Order was successfully destroyed." }
    end
  end

  def set_order
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :phone_number, :address, :quantity, :coupon_code)
  end
end
