module MPower
  class DirectCard < MPower::Checkout::Core
    attr_accessor :unity_transaction_id

    def charge(amount,card_details={})
      card_details[:amount] = amount
      result = http_json_request(MPower::Setup.direct_card_charge_base_url,card_details)

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
