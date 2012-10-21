module MPower
  module Checkout
    class Invoice

      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store

      def initialize
        @items = {}
        @temp_items = []
        @total_amount = 0.0
        @currency = "ghs"
        @store = MPower::Checkout::Store.new
      end

      # Adds invoice items to the @items hash, the idea is to allow this function to be used in a loop
      def add_item(name,quantity,unit_price,total_price)
        @items.merge!({
          :"item_#{@items.size}" => {
            :name => name,
            :quantity => quantity,
            :unit_price => unit_price,
            :total_price => total_price
          }
        })
      end

      def list_items
        MultiJson.dump @items
      end

      def confirm(token=nil)

      end

      def retrieve(token=nil)

      end

      def create

      end

    end
  end
end