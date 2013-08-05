class OrdersController < ApplicationController
  before_filter :check_if_logged_in, except: :index
  def index
    #github_logout
    @orders = Order.all
    @order = Order.new
  end
  
  def new
    @order = Order.new
  end
  
  def show
    @order = Order.find_by_slug(params[:id])
    if @order.closed && !@order.users.collect {|u| u.id}.include?(github_user.id) && @order.owner_id != github_user.id
      flash[:error] = "You don't have permission to see this page"
      redirect_to :root
    end
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
    @order = Order.find_by_slug(params[:id])
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
      flash[:error] = "You have to sign in first."
      redirect_to :root
    end
  end
end
