module MPower
  module Onsite
    class Invoice < MPower::Checkout::Invoice

      attr_accessor :invoice_token

      def initialize
        super
      end

      def charge(opr_token,confirm_token)
        payload = {
          :token => opr_token,
          :confirm_token => confirm_token
        }

        result = http_json_request(MPower::Setup.opr_charge_base_url,payload)

        case result["response_code"]
        when "00"
          @status = result["invoice_data"]["status"]
          @customer = result["invoice_data"]["customer"]
          @items = result["invoice_data"]["invoice"]["items"]
          @taxes = result["invoice_data"]["invoice"]["taxes"]
          @description = result["invoice_data"]["invoice"]["description"]
          @custom_data = result["invoice_data"]["custom_data"]
          @total_amount = result["invoice_data"]["invoice"]["total_amount"]
          @receipt_url = result["invoice_data"]["receipt_url"]
          @response_code = result["response_code"]
          @response_text = result["response_text"]
          true
        else
          @response_code = result["response_code"]
          @response_text = result["response_text"]
          false
        end
      end

      def create(account_alias)
        invoice_data = {
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
          :custom_data => @custom_data,
          :actions => {
            :cancel_url => @cancel_url,
            :return_url => @return_url
          }
        }

        payload = {
          :invoice_data => invoice_data,
          :opr_data => {
            :account_alias => account_alias
          }
        }

        result = http_json_request(MPower::Setup.opr_base_url,payload)
        case result["response_code"]
        when "00"
          @token = result["token"]
          @response_text = result["response_text"]
          @response_code = result["response_code"]
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