require 'minitest/spec'
require 'minitest/autorun'
require 'mpower'

describe MPower::Checkout::Invoice do
  before do
    @invoice = MPower::Checkout::Invoice.new do |inv|
      inv.
        add_item("Cart Item 1",1,10.00,10.00,"with optional description").
        add_item("Cart Item 2",5,5.00,25.00)
    end
  end

  describe "#items" do
    it "should have 3 items in the invoice" do
      @invoice.add_item("Cart Item 3", 3, 3.33, 9.99, "Cart Item 3 has description. Yay!")
      @invoice.items.size.must_equal 3
    end

    it "should be a Hash" do
      @invoice.items.must_be_instance_of Hash
      @invoice.items.each { |u, v| v.must_be_instance_of Hash }
    end
  end

  describe "#total_amount" do
    it "should have total_amount equal to sum of all total_prices" do
      @invoice.total_amount.must_equal 35.00

      @invoice.add_item("Cart Item 3", 3, 3.33, 9.99, "Cart Item 3 has description. Yay!")
      @invoice.add_item("Cart Item 4", 4, 4.44, 17.76)

      @invoice.total_amount.must_equal 62.75
    end

    it "should not allow total_amount to be manually set" do
      lambda { @invoice.total_amount = 1.00 }.must_raise NoMethodError
    end
  end
end
