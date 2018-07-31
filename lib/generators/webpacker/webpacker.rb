require_relative './../../wurk/random_port'

module Wurk
  class WebpackerGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def add_babel
      inject_into_file 'config/webpack/environment.js', after: "environment.loaders.append('coffee', coffee)\n" do
        "const babelLoader = environment.loaders.get('babel')\n" +
          "babelLoader.test = /\.(coffee|js|jsx)(\.erb)?$/\n"
      end
    end

    def delete_hello_coffee
      remove_file 'app/javascript/packs/hello_coffee.coffee'
    end

    def create_index_js
      create_file 'app/javascript/packs/index.js'
    end

    def set_pack
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<\/body>/ do
        "\n    <%= javascript_pack_tag 'index' %>"
      end
    end

    def set_port
      port = Wurk::RandomPort.get
      gsub_file 'config/webpacker.yml', /port: 3035/, "port: #{port}"
      gsub_file 'config/webpacker.yml', /public: localhost:3035/, "public: localhost:#{port}"
    end
  end
end
