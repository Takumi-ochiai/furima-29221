class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if (current_user.id == @item.user_id) || @item.item_purchase
    @order = OrderItemPurchase.new
  end

  def create
    @order = OrderItemPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  # クレジット決済
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  # クレジット決済
end

# valid?メソッドは以下の2つの役割がありました。

# 作成したデータが正しく保存される場合はtrueを、保存されない場合はfalseを返す
# 保存されない場合は「なぜ保存されないのか」のエラーメッセージを生成する
