require 'test/unit'
require 'mpower'

class TestMPower < Test::Unit::TestCase
  def test_checkout_invoice_items
    invoice = MPower::Checkout::Invoice.new
    invoice.add_item("Cart Item 1",1,10.00,10.00,"with optional description")
    invoice.add_item("Cart Item 2",5,5.00,25.00)
    invoice.total_amount = 55.00
    invoice.description = "Unit::Test Invoice from Ruby lang"
    assert_instance_of(Hash, invoice.get_items)
    assert_equal(2, invoice.get_items.size)
    assert_instance_of(Hash, invoice.get_items[:item_0])
    assert_equal(5, invoice.get_items[:item_0].size)
    assert_equal("{:name=>\"Cart Item 1\", :quantity=>1, :unit_price=>10.0, :total_price=>10.0, :description=>\"with optional description\"}", invoice.get_items[:item_0].to_s)
  end
end