module MPower
  module Checkout
    class Invoice < MPower::Checkout::Core

      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store, :cancel_url, :return_url, :invoice_url
      BASE_URL = "http://0.0.0.0:3000/checkout-invoice/create"
      def initialize
        @items = {}
        @taxes = {}
        @total_amount = 0.0
        @currency = "ghs"
        @store = MPower::Checkout::Store
        @return_url = @store.return_url
        @cancel_url = @store.cancel_url
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

      def get_items
        hash_to_json @items
      end

      def get_taxes
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
          :actions => {
            :cancel_url => @cancel_url,
            :return_url => @return_url
          }
        }

        result = http_request(BASE_URL,{:data => checkout_payload },true)

        case result["response_code"]
        when "00"
          @response_text = result["response_description"]
          @response_code = result["response_code"]
          @invoice_url = result["response_text"]
          @status = MPower::SUCCESS
          true
        else
          @response_text = result["response_text"]
          @response_code = result["response_code"]
          @invoice_url = nil
          @status = MPower::FAIL
          false
        end
      end

    end
  end
end