module MPower
  module Setup
    @@master_key = nil
    @@private_key = nil
    @@public_key = nil
    @@token = nil
    @@mode = "test"

    ROOT_URL_BASE = "https://app.mpowerpayments.com"

    LIVE_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/api/v1/checkout-invoice/create"
    TEST_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/create"

    LIVE_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/api/v1/checkout-invoice/confirm/"
    TEST_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/confirm/"

    LIVE_OPR_BASE_URL = "#{ROOT_URL_BASE}/api/v1/opr/create"
    TEST_OPR_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/opr/create"

    LIVE_OPR_CHARGE_BASE_URL = "#{ROOT_URL_BASE}/api/v1/opr/charge"
    TEST_OPR_CHARGE_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/opr/charge"

    LIVE_DIRECT_PAY_CREDIT_BASE_URL = "#{ROOT_URL_BASE}/api/v1/direct-pay/credit-account"
    TEST_DIRECT_PAY_CREDIT_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/direct-pay/credit-account"

    LIVE_DIRECT_CREDITCARD_CHARGE_URL = "#{ROOT_URL_BASE}/api/v1/direct-card/processcard"
    TEST_DIRECT_CREDITCARD_CHARGE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/direct-card/processcard"

    LIVE_DIRECT_MOBILE_CHARGE_URL = "#{ROOT_URL_BASE}/api/v1/direct-mobile/charge"
    TEST_DIRECT_MOBILE_CHARGE_URL = "#{ROOT_URL_BASE}/api/v1/direct-mobile/charge"
    LIVE_DIRECT_MOBILE_TX_STATUS_URL = "#{ROOT_URL_BASE}/api/v1/direct-mobile/status"
    TEST_DIRECT_MOBILE_TX_STATUS_URL = "#{ROOT_URL_BASE}/api/v1/direct-mobile/status"

    def self.master_key=(master_key); @@master_key = master_key; end
    def self.master_key; @@master_key; end
    def self.private_key=(private_key); @@private_key = private_key; end
    def self.private_key; @@private_key; end
    def self.public_key=(public_key); @@public_key = public_key; end
    def self.public_key; @@public_key; end
    def self.token=(token); @@token = token; end
    def self.token; @@token; end

    def self.mode=(mode); @@mode = mode; end
    def self.mode; @@mode; end

    def self.checkout_base_url
        @@mode == "live" ? LIVE_CHECKOUT_INVOICE_BASE_URL : TEST_CHECKOUT_INVOICE_BASE_URL
    end

    def self.checkout_confirm_base_url
        @@mode == "live" ? LIVE_CHECKOUT_CONFIRM_BASE_URL : TEST_CHECKOUT_CONFIRM_BASE_URL
    end

    def self.opr_base_url
        @@mode == "live" ? LIVE_OPR_BASE_URL : TEST_OPR_BASE_URL
    end

    def self.opr_charge_base_url
        @@mode == "live" ? LIVE_OPR_CHARGE_BASE_URL : TEST_OPR_CHARGE_BASE_URL
    end

    def self.direct_pay_credit_base_url
        @@mode == "live" ? LIVE_DIRECT_PAY_CREDIT_BASE_URL : TEST_DIRECT_PAY_CREDIT_BASE_URL
    end

    def self.direct_card_charge_base_url
        @@mode == "live" ? LIVE_DIRECT_CREDITCARD_CHARGE_URL : TEST_DIRECT_CREDITCARD_CHARGE_URL
    end

    def self.direct_mobile_charge_base_url
        @@mode == "live" ? LIVE_DIRECT_MOBILE_CHARGE_URL : TEST_DIRECT_MOBILE_CHARGE_URL
    end

    def self.direct_mobile_tx_status_base_url
        @@mode == "live" ? LIVE_DIRECT_MOBILE_TX_STATUS_URL : TEST_DIRECT_MOBILE_TX_STATUS_URL
    end

  end
end