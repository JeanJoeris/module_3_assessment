class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head 204
  end

  def create
    @item = Item.create(item_params)
    render status: 201
  end

  private
    def item_params
      params.permit(:name, :image_url, :description)
    end
end
