module MPower
  module Checkout
    class Invoice < MPower::Checkout::Core

      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store, :cancel_url, :return_url
      CREATE_BASE_URL = "https://app.mpowerpayments.com/co-invoice"
      def initialize
        @items = {}
        @taxes = {}
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

      # Adds invoice tax to the @taxes hash, the idea is to allow this function to be used in a loop
      def add_tax(name,amount)
        @taxes.merge!({
          :"tax_#{@taxes.size}" => {
            :name => name,
            :amount => amount
          }
        })
      end

      def list_items
        hash_to_json @items
      end

      def list_taxes
        hash_to_json @taxes
      end

      def confirm(token=nil)

      end

      def retrieve(token=nil)

      end

      def create
        checkout_payload = {
          :invoice => {
            :items => @items,
            :taxes => @taxes,
            :total_amount => @total_amount,
            :description => description
          },
          :store => {
            :name => @store.name,
            :tagline => @store.tagline,
            :postal_address => @store.postal_address,
            :phone => @store.phone_number,
            :logo_url => @store.logo_url,
            :website_url => @store.website_url
          },
          :action => {
            :cancel_url => @cancel_url,
            :return_url => @return_url
          }
        }
        token = MPower.mode == "live" ? MPower.live_token : MPower.test_token
        http_request("#{CREATE_BASE_URL}/#{token}",{:data => checkout_payload },true)
      end

    end
  end
end