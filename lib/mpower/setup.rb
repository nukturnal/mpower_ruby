module MPower
  module Setup
    @@master_key = nil
    @@private_key = nil
    @@public_key = nil
    @@token = nil
    @@mode = "test"

    ROOT_URL_BASE = "http://localhost:3000"
    LIVE_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/api/v1/checkout-invoice/create"
    TEST_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/create"
    LIVE_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/api/v1/checkout-invoice/confirm/"
    TEST_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/confirm/"
    LIVE_OPR_BASE_URL = "#{ROOT_URL_BASE}/api/v1/opr/create"
    TEST_OPR_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/opr/create"
    LIVE_OPR_CHARGE_BASE_URL = "#{ROOT_URL_BASE}/api/v1/opr/charge"
    TEST_OPR_CHARGE_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/opr/charge"

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

  end
end