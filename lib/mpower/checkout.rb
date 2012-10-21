module MPower
  module Checkout
    class Core
      include MPower::Utilities

      attr_accessor :status, :response_message, :response_code
    end
  end
end

%w(checkout/invoice
  checkout/store
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end