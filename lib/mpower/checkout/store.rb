module MPower
  module Checkout
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
end