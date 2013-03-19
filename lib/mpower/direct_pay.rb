module MPower
  class DirectPay < MPower::Checkout::Core

    def credit_account(payee_account,amount)
      payload = {
        :account_alias => payee_account,
        :amount => amount
      }

      result = http_json_request(MPower::Setup.direct_pay_credit_base_url,payload)
      if result["response_code"] == "00"
        push_results(result)
        true
      else
        push_results(result)
        false
      end
    end
  end
end