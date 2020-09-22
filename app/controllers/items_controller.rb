class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end
  
end
