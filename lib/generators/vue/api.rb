module Wurk
  module Vue
    class ApiGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_api_file
        template "api.coffee", "app/javascript/api/#{file_name}.coffee"
      end
    end
  end
end
