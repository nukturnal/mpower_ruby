module MPower
  module Checkout
    class Core
      include MPower::Utils
    end
  end
end

%w(checkout/invoice
  checkout/store
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end