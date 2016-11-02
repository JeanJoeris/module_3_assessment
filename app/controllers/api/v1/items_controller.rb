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
    head 204
  end

  def create
    @item = Item.create(item_params)
    render json: @item, status: 201
  end

  private
    def item_params
      params.permit(:name, :image_url, :description)
    end
end
