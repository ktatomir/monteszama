class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      flash[:notice] = "Payment added!"
      redirect_to @payment.order
    else
      flash[:error] = @payment.errors.full_messages.join(", ")
      redirect_to order_path(@payment.order_id)
    end
  end
end
