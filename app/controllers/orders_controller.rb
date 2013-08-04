class OrdersController < ApplicationController
  before_filter :check_if_logged_in, except: :index
  def index
    #github_logout
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  def show
    @order = Order.find(params[:id])
    @items = @order.items
    @item = Item.new
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Order created successfully!"
      redirect_to @order
    else
      flash[:error] = "There was a problem with creating an order"
      render :new
    end
  end
  
  private
  
  def check_if_logged_in
    if !github_authenticated? 
      redirect_to :root
    end
  end
end
