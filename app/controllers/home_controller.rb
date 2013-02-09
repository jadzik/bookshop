#encoding: utf-8
class HomeController < ApplicationController
  
 def about_company
   @cart = current_order
 end  
 def contact_us
   @cart = current_order
 end 
 def index
   @cart = current_order
 end 
 def rules
   @cart = current_order
 end 
end
