
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
  end
end
