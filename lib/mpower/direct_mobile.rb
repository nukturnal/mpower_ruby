module MPower
  class DirectMobile < MPower::Checkout::Core

    attr_accessor :mobile_invoice_no, :tx_status, :cancel_reason
    def charge(amount,customer_details={})
      customer_details[:amount] = amount
      result = http_json_request(MPower::Setup.direct_mobile_charge_base_url,customer_details)

      if result["response_code"] == "00"
        @mobile_invoice_no = result["mobile_invoice_no"]
        push_results(result)
        true
      else
        push_results(result)
        false
      end
    end

    # Poll this method for completed / pending / failed / cancelled status
    def transaction_status(token)
      payload = { :token => token }
      result = http_json_request(MPower::Setup.direct_mobile_tx_status_base_url,payload)

      if result["response_code"] == "00"
        @tx_status = result["tx_status"]
        @mobile_invoice_no = result["mobile_invoice_no"]
        @cancel_reason = result["cancel_reason"]
        push_results(result)
        true
      else
        push_results(result)
        false
      end
    end
  end
end
