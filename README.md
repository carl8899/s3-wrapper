# s3-wrapper

This gem copies file to s3. It's especially useful to copy backup to s3 in organized structure.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 's3-wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install s3-wrapper

## Usage

Make your profile and upload files to s3.

```bash
s3-wrapper config-default aws_access_key='aws-access-key' aws_secret_key='aws-secret-key' bucket_name='some-bucket-to-use' host_name='name-of-host-to-backup'
s3-wrapper create-profile 'profile-name' key1=value1 key2=value2
s3-wrapper update-profile 'profile-name' key1=value1 key2=value2
s3-wrapper delete-profile 'profile-name'

s3-wrapper upload 'profile-name' file1 file2
```

## Contributing

1. Fork it ( https://github.com/carl8899/s3-wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request