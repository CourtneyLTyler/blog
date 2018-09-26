class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    #byebug
    @orders = Order.includes(:product).all
  end

  def show
    #byebug
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
