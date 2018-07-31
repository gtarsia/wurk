
module Wurk
  module Devise
    class GemsGenerator < Rails::Generators::Base
      def add_gems
        append_to_file 'Gemfile', "gem 'bcrypt'\n"
        append_to_file 'Gemfile', "gem 'devise'\n"
        append_to_file 'Gemfile', "gem 'omniauth-google-oauth2'\n"
      end
    end
  end
end

