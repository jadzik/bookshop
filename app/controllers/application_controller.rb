#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cart
  @order = Order.find(1)
    def cart
      session[:order] ||= Order.new
    end

#  rescue Exception => e
#    flash[:error] =  "Przykro nam, ale wystąpił błąd."
#    redirect_to root_url
#  end
#  rescue_from CanCan::AccessDenied do |exception|  
#    flash[:error] = "Nie masz prawa do wykonania tej akcji!"  
#    redirect_to root_url  
#  end
end
