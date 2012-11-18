require 'test/unit'
require 'mpower'

class TestMPower < Test::Unit::TestCase
  def test_checkout_invoice_items
    invoice = MPower::Checkout::Invoice.new
    invoice.add_item("Cart Item 1",1,10.00,10.00,"with optional description")
    invoice.add_item("Cart Item 2",5,5.00,25.00)
    invoice.total_amount = 55.00
    invoice.description = "Unit::Test Invoice from Ruby lang"
    assert_equal("{\"item_0\":{\"name\":\"Cart Item 1\",\"quantity\":1,\"unit_price\":10.0,\"total_price\":10.0,\"description\":\"with optional description\"},\"item_1\":{\"name\":\"Cart Item 2\",\"quantity\":5,\"unit_price\":5.0,\"total_price\":25.0,\"description\":\"\"}}",invoice.get_items)
  end
end