require 'yaml'

class S3Wrapper
  class Profile
    attr_accessor :name, :aws_access_key, :aws_secret_key, :bucket_name, :host_name
    CONFIG_FILE = '.s3-wrapper.rc'

    def self.config_default(params)
      self::create('default', params)
    end

    def self.create(name, params)
      config = read_config(name, false)
      params.each do |key, value|
        config[name][key] = value
      end
      self::write_config(config)
      S3Wrapper::Profile.new(name, config[name])
    end

    def self.delete(name)
      config = read_config(name, false)
      config.delete(name)
      self::write_config(config)
    end

    def self.get(name)
      config = read_config(name, true)
      S3Wrapper::Profile.new(name, config[name])
    end

    def initialize(name, params = {})
      self.name = name
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def to_hash
      Hash[*instance_variables.map { |v|
        [v.to_sym, instance_variable_get(v)]
      }.flatten]
    end

    private
    def self.read_config(name, with_default)
      config = {}
      begin
        config = File.open(ENV['HOME'] + '/' + CONFIG_FILE) { |f| YAML.load(f) }
      rescue

      end
      config = {} unless config
      config[name] = {} unless config[name]
      if with_default && config['default'] && name != 'default'
        config['default'].each do |key, value|
          config[name][key] = value unless config[name][key] && value;
        end
      end
      config
    end

    def self.write_config(config)
      open(ENV['HOME'] + '/' + CONFIG_FILE, 'w+') { |f| YAML.dump(config, f) }
    end
  end
end
