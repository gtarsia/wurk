module Werk
  module Vue
    class AppGenerator < Rails::Generators::Base
      def create_app
        copy_file "vue_root.coffee", "app/javascript/vue_root.coffee"
        directory "api", "app/javascript/api"
        directory "components", "app/javascript/components"
        directory "misc", "app/javascript/misc"
        directory "mixins", "app/javascript/mixins"
        directory "store", "app/javascript/store"
        append_to_file 'packs/index.coffee', "import './../vue_root.coffee'"
      end
    end
  end
end
