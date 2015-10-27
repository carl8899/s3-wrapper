module S3Wrapper::Test
	def self.profile
		S3Wrapper::Profile.get('default')
	end

  def self.test_connection
    @test_connection ||= AWS::S3.new(access_key_id: profile.aws_access_key, secret_access_key: profile.aws_secret_key)
  end
end

RSpec.configure do |config|
  config.before :suite do
    S3Wrapper::Test.test_connection
  end
end
