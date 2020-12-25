class OrdersController < ApplicationController
  def index
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:content, :image).merge(user_id: current_user.id)
  end
end
