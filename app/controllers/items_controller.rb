class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end
    return if current_user.id == @item.user_id

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])

    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
      return
    end

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :info, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :shipping_day_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
