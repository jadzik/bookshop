class OrderCell < Cell::Rails
  def display(args)
    client = args[:client]
    @order_items  = client.order.order_items #może być więcej zamówień :(
    render  # renders display.html.haml
  end
end
