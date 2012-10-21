module MPower
  module Checkout
    class Store
      attr_accessor :name, :tagline, :logo_url, :website_url, :postal_address, :phone_number
      def initialize
        @name = "Untitled Store"
        @tagline = "Put your online store's tagline here."
      end
    end
  end
end