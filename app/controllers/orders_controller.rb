class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def order_params
      params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
    end

end
