class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderDelivery.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end

  def create
    @order = OrderDelivery.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id, :order_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
