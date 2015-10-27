require "s3-wrapper/version"
require "s3-wrapper/profile"
require 'aws-sdk'

class S3Wrapper
  attr_accessor :profile
  attr_reader :aws_access_key, :aws_secret_key, :bucket_name, :host_name, :s3

  def self.upload_files(profile, files)
    wrapper = S3Wrapper.new(profile)
    files.each do |file|
      wrapper.upload_file(file)
    end
  end

  def initialize(profile)
    self.profile = profile
    AWS.config(access_key_id: aws_access_key, secret_access_key: aws_secret_key, region: 'us-west-2')
  end

  def aws_access_key
    profile.aws_access_key
  end

  def aws_secret_key
    profile.aws_secret_key
  end

  def bucket_name
    profile.bucket_name
  end

  def host_name
    profile.host_name
  end

  def profile_name
    profile.name
  end

  def s3
    @s3 ||= AWS::S3.new()
  end

  def bucket
    @bucket ||= s3.buckets[bucket_name]
  end

  def upload_file(file)
    puts "Uploading #{file}"
    today = Time.now.strftime("%Y%m%d")
    key = File.basename(file)
    key = "#{host_name}/#{profile_name}/#{today}/#{key}"
    bucket.objects[key].delete
    bucket.objects[key].write(file: file, acl: :authenticated_read)
  end
end
