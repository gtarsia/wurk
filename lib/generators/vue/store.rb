module Wurk
  module Vue
    class StoreGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_api_file
        @var_name = file_name.camelcase(:lower)
        @resource_name = file_name.camelcase(:upper)
        inject_into_file 'app/javascript/store/index.coffee', after: /modules:.*{\n/ do
          "    #{file_name},\n"
        end
        prepend_to_file 'app/javascript/store/index.coffee', "import #{file_name} from 'store/#{file_name}'\n"
        template "store.coffee", "app/javascript/store/#{file_name}.coffee"
      end
    end
  end
end
