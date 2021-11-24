class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  private

  def render_not_found_response
    render json: { error: "Item not found" }, status: :not_found
  end

  def create
    Item.create()
  end

end
