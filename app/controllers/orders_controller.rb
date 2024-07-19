class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_item_availability

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_item_availability
    return unless @item.order.present? || current_user == @item.user

    redirect_to root_path
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
