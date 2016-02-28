module MPower
  module Checkout
    class Invoice < MPower::Checkout::Core

      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store, :invoice_token
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
      def add_item(name,quantity,unit_price,total_price,description="")
        @items.merge!({
          :"item_#{@items.size}" => {
            :name => name,
            :quantity => quantity,
            :unit_price => unit_price,
            :total_price => total_price,
            :description => description
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

      def add_custom_data(key,value)
        @custom_data["#{key}"] = value
      end

      def get_items
        @items
      end

      def get_taxes
        @taxes
      end

      def get_customer_info(key)
        @customer["#{key}"]
      end

      def get_custom_data(key)
        @custom_data["#{key}"]
      end

      def confirm(token)
        result = http_get_request("#{MPower::Setup.checkout_confirm_base_url}#{token}")
        unless result.size > 0
          @response_text = "Invoice Not Found"
          @response_code = 1002
          @status = MPower::FAIL
          return false
        end

        if result["status"] == "completed"
          rebuild_invoice(result)
          @response_text = result["response_text"]
          true
        else
          @status = result["status"]
          @items = result["invoice"]["items"]
          @taxes = result["invoice"]["taxes"]
          @description = result["invoice"]["description"]
          @custom_data = result["custom_data"]
          @total_amount = result["invoice"]["total_amount"]
          @response_text = "Invoice status is #{result['status'].upcase}"
          false
        end
      end

      def create
        result = http_json_request(MPower::Setup.checkout_base_url,build_invoice_payload)
        create_response(result)
      end

      protected
      def build_invoice_payload
        { :invoice => {
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
        :custom_data => @custom_data,
        :actions => {
          :cancel_url => @cancel_url,
          :return_url => @return_url
        }
      }
      end

      def rebuild_invoice(result={})
        @status = result["status"]
        @customer = result["customer"]
        @items = result["invoice"]["items"]
        @taxes = result["invoice"]["taxes"]
        @description = result["invoice"]["description"]
        @custom_data = result["custom_data"]
        @total_amount = result["invoice"]["total_amount"]
        @receipt_url = result["receipt_url"]
        @invoice_token = result["invoice_token"]
      end

      def create_response(result={})
        if result["response_code"] == "00"
          @token = result["token"]
          @invoice_token = result["invoice_token"]
          @response_text = result["response_description"]
          @response_code = result["response_code"]
          @invoice_url = result["response_text"]
          @invoice_token = result["invoice_token"]
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
