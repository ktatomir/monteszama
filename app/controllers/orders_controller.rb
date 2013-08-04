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
    @caller = User.find(@order.caller_id) if @order.caller_id
    @payment = Payment.new
    @payments = @order.payments
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
  
  def update
    @order = Order.find(params[:id])
    if @order.update_attribute(:closed, true)
      @order.choose_caller
      flash[:notice] = "Order closed"
      redirect_to @order
    else
      flash[:error] = "Couldn't close the order, sorry :("
      redirect_to @order
    end
  end
  
  private
  
  def check_if_logged_in
    if !github_authenticated? 
      redirect_to :root
    end
  end
end
