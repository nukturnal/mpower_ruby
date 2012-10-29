module MPower
  module Setup
    @@master_key = nil
    @@private_key = nil
    @@public_key = nil
    @@token = nil
    @@mode = "test"

    LIVE_CHECKOUT_INVOICE_BASE_URL = "https://app.mpowerpayments.com/api/v1/checkout-invoice/create";
    TEST_CHECKOUT_INVOICE_BASE_URL = "https://app.mpowerpayments.com/sandbox-api/v1/checkout-invoice/create";
    LIVE_CHECKOUT_CONFIRM_BASE_URL = "https://app.mpowerpayments.com/api/v1/checkout-invoice/confirm/";
    TEST_CHECKOUT_CONFIRM_BASE_URL = "https://app.mpowerpayments.com/sandbox-api/v1/checkout-invoice/confirm/";

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
  end
end