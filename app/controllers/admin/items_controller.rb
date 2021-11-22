class Admin::ItemsController < ApplicationController
layout 'admin'
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice:'商品が登録されました'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
end
