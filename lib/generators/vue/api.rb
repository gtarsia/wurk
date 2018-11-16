module Wurk
  module Vue
    class ApiGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_api_file
        @resource_name = file_name.singularize.underscore
        template "api.coffee", "app/javascript/api/#{file_name}.coffee"
      end
    end
  end
end
