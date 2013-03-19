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
        push_results(result)
        @unity_transaction_id = result["unity_transaction_id"]
        true
      else
        push_results(result)
        false
      end
    end
  end
end