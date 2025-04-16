class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :ensure_owner, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_owner
    return if current_user.id == @item.user_id

    redirect_to root_path
    nil
  end

  def item_params
    params.require(:item).permit(
      :name, :info, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :shipping_day_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
