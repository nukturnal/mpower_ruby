module MPower
  module Checkout
    class Invoice < MPower::Checkout::Core

      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store
      attr_accessor :customer, :custom_data, :cancel_url, :return_url, :invoice_url, :receipt_url

      def initialize
        @items = {}
        @taxes = {}
        @custom_data = {}
        @customer = {}
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

      def get_customer_info(key)
        @customer["#{key}"]
      end

      def get_custom_data(key)
        @custom_data["#{name}"]
      end

      def confirm(token)
        result = http_get_request("#{MPower::Setup.checkout_confirm_base_url}#{token}");
        if result.size > 0
          case result['status']
          when 'completed'
            @status = result['status']
            @customer = result['customer']
            @items = result['invoice']['items']
            @taxes = result['invoice']['taxes']
            @description = result['invoice']['description']
            @custom_data = result['custom_data']
            @total_amount = result['invoice']['total_amount']
            @receipt_url = result['receipt_url']
            true
          else
            @status = result['status']
            @items = result['invoice']['items']
            @taxes = result['invoice']['taxes']
            @description = result['invoice']['description']
            @custom_data = result['custom_data']
            @total_amount = result['invoice']['total_amount']
            @response_text = "Invoice status is #{result['status'].upcase}"
            false
          end
        else
          @response_text = "Invoice Not Found"
          @response_code = 1002
          @status = MPower::FAIL
          false
        end
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

        result = http_json_request(MPower::Setup.checkout_base_url,checkout_payload)
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