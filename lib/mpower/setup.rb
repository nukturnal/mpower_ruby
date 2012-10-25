module MPower
  module Setup
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
end