#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :make_order
  before_filter :count_cart
    def make_order
      @current_order ||= Order.new
    end

  def count_cart
   session[:count] ||= 0
  end

#  rescue Exception => e
#    flash[:error] =  "Przykro nam, ale wystąpił błąd."
#    redirect_to root_url
#  end
end
