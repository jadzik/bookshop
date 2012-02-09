class CartCell < Cell::Rails
  def display(args)
    client = args[:client]
    @products  = client.products_in_cart
    render  # renders display.html.haml
  end
end
