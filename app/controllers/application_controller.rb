#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
private
  def current_order
    cart = Order.find(session[:order_id])
    if  cart.status != 'cart'
      order = Order.create
      session[:order_id] = order.id
      order
    end
    cart
  rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end 
end
