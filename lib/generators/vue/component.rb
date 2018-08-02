module Wurk
  module Vue
    class ComponentGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_api_file
        template "component.coffee", "app/javascript/components/#{file_name}.coffee"
      end
    end
  end
end
