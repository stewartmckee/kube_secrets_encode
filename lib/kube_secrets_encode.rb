require "kube_secrets_encode/version"
require 'executable'
require 'yaml'
require 'awesome_print'
require 'base64'
module KubeSecretsEncode

  class Command
    include Executable

    # filename of file being encoded or decoded
    def file=(filename)
      @file = filename
    end
    def file
      @file
    end

    # enables write after decode or encode
    def yes=(bool)
      @yes = bool
    end
    def yes?
      @yes
    end
    # switch from default encode to decode mode
    def decode=(bool)
      @decode = bool
    end
    def decode?
      @decode
    end

    # Show this message.
    def help?
      cli.show_help
      exit
    end
    alias :h? :help?

    def self.usage_name
      "kube_secrets"
    end

    # kube_secrets enables you to encode and decode the base64 encoding of secrets in place within your config files making it easier to modify them.
    def call()
      documents = []
      if file && File.exists?(file)
        YAML.load_stream(File.open(file)) do |document|
          if document["kind"] == "Secret"
            if document["data"]
              document["data"].each do |k,v|
                if decode?
                  document["data"][k] = Base64.strict_decode64(v)
                else
                  document["data"][k] = Base64.strict_encode64(v)
                end
              end
            end
          end
          documents << document
        end
        yaml = documents.map{|d| d.to_yaml}.join

        puts yaml
        if yes?
          File.open(file, 'w') { |file| file.write(yaml) }
        end
      else
        cli.show_help
      end
      exit
    end
  end
end
