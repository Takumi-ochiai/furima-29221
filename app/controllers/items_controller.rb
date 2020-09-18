class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user: current_user.id)
  end
end
