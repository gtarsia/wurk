require_relative './../../wurk/random_port'

module Wurk
  module Devise
    class ConfigGenerator < Rails::Generators::Base

      def protect_from_forgery
        inject_into_class 'app/controllers/application_controller.rb', ApplicationController do
          "  protect_from_forgery prepend: true\n" 
        end
      end

    end
  end
end
