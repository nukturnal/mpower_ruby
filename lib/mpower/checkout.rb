module MPower
  module Checkout
    class Core
      include MPower::Utilities

      attr_accessor :status, :response_text, :response_code, :token
    end
  end
end

%w(checkout/redirect_invoice
  checkout/onsite_invoice
  checkout/store
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end