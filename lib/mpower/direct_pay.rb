module MPower
  class DirectPay
    include MPower::Utilities
    attr_accessor :status, :response_text, :response_code, :transaction_id, :description

    def credit_account(payee_account,amount)
      payload = {
        :account_alias => payee_account,
        :amount => amount
      }

      result = http_json_request(MPower::Setup.direct_pay_credit_base_url,payload)
      if result["response_code"] == "00"
        @transaction_id = result["transaction_id"]
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