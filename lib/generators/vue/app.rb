module Wurk
  module Vue
    class AppGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_app
        inject_into_file 'config/webpack/environment.js', before: "\nmodule.exports" do
          <<~HEREDOC


          environment.config.devtool = 'eval'
          environment.config.resolve.alias = {
            'vue$': 'vue/dist/vue.js'
          }
          HEREDOC
        end
        copy_file "vue_root.coffee", "app/javascript/vue_root.coffee"
        directory "api", "app/javascript/api"
        directory "components", "app/javascript/components"
        directory "misc", "app/javascript/misc"
        directory "mixins", "app/javascript/mixins"
        directory "store", "app/javascript/store"
        append_to_file 'packs/index.js', "import './../vue_root.coffee'"
        copy_file 'routes_generator.rb', "lib/generators/routes_generator.rb"
      end
    end
  end
end
