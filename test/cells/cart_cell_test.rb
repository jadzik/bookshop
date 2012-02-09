require 'test_helper'

class CartCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
