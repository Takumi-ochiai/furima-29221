class ItemsController < ApplicationController
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path
    else
       render'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
