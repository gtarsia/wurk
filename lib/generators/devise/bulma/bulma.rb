module Wurk
  module Devise
    class BulmaGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      def add_bulma_views
        directory 'templates' 'app/views/devise'
      end
    end
  end
end
