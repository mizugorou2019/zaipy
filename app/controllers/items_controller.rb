class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(id: 'ASC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to action: :index
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.id == 1 || 2
      @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :quantity, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
