module MPower
  module Integration
    @@master_key = nil
    @@private_key = nil
    @@public_key = nil
    @@token = nil

    @@mode = "test"

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