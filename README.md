# s3-wrapper

This gem copies files to AWS S3. It's especially useful to upload files to AWS S3 in organized structure.

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

### Commands to manage the configuration file

```bash
s3-wrapper config-default aws_access_key='aws-access-key' aws_secret_key='aws-secret-key' bucket_name='some-bucket-to-use' host_name='name-of-host-to-backup'
s3-wrapper create-profile 'profile-name' aws_access_key=value1 aws_secret_key=value2
s3-wrapper update-profile 'profile-name' host_name=value1
s3-wrapper get-profile 'profile-name'
s3-wrapper delete-profile 'profile-name'
```

### Configuration keys
Following four values need to be configured to run the tool successfully.

1. aws_access_key - AWS access key
2. aws_access_key - AWS secret key
3. bucket_name - The name of AWS S3 bucket which the file would be uploaded to
4. host_name - The name of the host which the profile is related to


### Commands to upload files

```bash
s3-wrapper upload 'profile-name' file1 file2
```

This tool uploads files under following hierachy. The bucket needs to be created beforehand and directories are automatically created by the tool.

```bash
s3://@bucket_name@/@host_name@/@profile-name@/@curr_yy_mm@/@filename@
```

The profile would override default configuration values.

## Contributing

1. Fork it ( https://github.com/carl8899/s3-wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
