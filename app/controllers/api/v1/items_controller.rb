class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head 200
  end
end
