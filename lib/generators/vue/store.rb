module Wurk
  module Vue
    class StoreGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_store_file
        @store_name = file_name.singularize.camelcase(:lower)
        @api_name = file_name.singularize.camelcase(:upper)
        inject_into_file 'app/javascript/store/index.coffee', after: /modules:.*{\n/ do
          "    #{@store_name},\n"
        end
        prepend_to_file 'app/javascript/store/index.coffee', "import #{@store_name} from 'store/#{file_name}'\n"
        template "store.coffee", "app/javascript/store/#{file_name}.coffee"
      end
    end
  end
end
