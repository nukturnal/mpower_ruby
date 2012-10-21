module MPower
  @@live_master_key = ""
  @@live_private_key = ""
  @@live_public_key = ""
  @@live_token = ""

  @@test_master_key = ""
  @@test_private_key = ""
  @@test_public_key = ""
  @@test_token = ""

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

MPower.test_public_key = 'test_public_SZtKc5Vjti3cNq65FI2vcwKy5zU'
MPower.test_private_key  = 'test_private_9tc8KTomInEKN42mIhr8cMXSfHA'
MPower.test_master_key  = 'dd6f2c90-f075-012f-5b69-00155d866600'
MPower.mode  = 'test'
MPower.test_token  = '1d44438125c4f936965c'