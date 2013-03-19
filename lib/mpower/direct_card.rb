module MPower
  class DirectCard < MPower::Checkout::Core
    attr_accessor :unity_transaction_id

    def charge(amount,card_details={})
      payload = {
        :card_name => card_details[:card_name],
        :card_number => card_details[:card_number],
        :card_cvc => card_details[:card_cvc],
        :exp_month => card_details[:exp_month],
        :exp_year => card_details[:exp_year],
        :amount => amount
      }

      result = http_json_request(MPower::Setup.direct_card_charge_base_url,payload)
      
      if result["response_code"] == "00"
        @transaction_id = result["transaction_id"]
        @unity_transaction_id = result["unity_transaction_id"]
        @description = result["description"]
        @response_code = result["response_code"]
        @status = MPower::SUCCESS
        true
      else
        @response_text = result["response_text"]
        @response_code = result["response_code"]
        @status = MPower::FAIL
        false
      end
    end
  end
end