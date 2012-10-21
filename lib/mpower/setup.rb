module MPower
  module Integration
    @@live_master_key = nil
    @@live_private_key = nil
    @@live_public_key = nil
    @@live_token = nil

    @@test_master_key = nil
    @@test_private_key = nil
    @@test_public_key = nil
    @@test_token = nil

    @@mode = "test"

    def self.live_master_key=(live_master_key); @@live_master_key = live_master_key; end
    def self.live_master_key; @@live_master_key; end
    def self.live_private_key=(live_private_key); @@live_private_key = live_private_key; end
    def self.live_private_key; @@live_private_key; end
    def self.live_public_key=(live_public_key); @@live_public_key = live_public_key; end
    def self.live_public_key; @@live_public_key; end
    def self.live_token=(live_token); @@live_token = live_token; end
    def self.live_token; @@live_token; end
    def self.test_master_key=(test_master_key); @@test_master_key = test_master_key; end
    def self.test_master_key; @@test_master_key; end
    def self.test_private_key=(test_private_key); @@test_private_key = test_private_key; end
    def self.test_private_key; @@test_private_key; end
    def self.test_public_key=(test_public_key); @@test_public_key = test_public_key; end
    def self.test_public_key; @@test_public_key; end
    def self.test_token=(test_token); @@test_token = test_token; end
    def self.test_token; @@test_token; end

    def self.mode=(mode); @@mode = mode; end
    def self.mode; @@mode; end
  end

  module Store
    @@name = "Untitled Store"
    @@tagline = "Put your online store's tagline here."
    @@postal_address = nil
    @@phone_number = nil
    @@website_url = nil
    @@logo_url = nil

    def self.name=(name); @@name = name; end
    def self.name; @@name; end
    def self.tagline=(tagline); @@tagline = tagline; end
    def self.tagline; @@tagline; end
    def self.postal_address=(postal_address); @@postal_address = postal_address; end
    def self.postal_address; @@postal_address; end
    def self.phone_number=(phone_number); @@phone_number = phone_number; end
    def self.phone_number; @@phone_number; end
    def self.website_url=(website_url); @@website_url = website_url; end
    def self.website_url; @@website_url; end
    def self.logo_url=(logo_url); @@logo_url = logo_url; end
    def self.logo_url; @@logo_url; end
  end
end