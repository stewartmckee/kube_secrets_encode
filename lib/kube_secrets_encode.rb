require "kube_secrets_encode/version"
require 'executable'
require 'yaml'
require 'awesome_print'
require 'base64'
module KubeSecretsEncode

  class Command
    include Executable

    def yes=(bool)
      @yes = bool
    end

    def yes?
      @yes
    end
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

    # Say hello.
    def call(file)
      documents = []
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
    end
  end
end
