
module Wurk
  module Devise
    class GemsGenerator < Rails::Generators::Base
      def add_gems
        append_to_file 'Gemfile', "gem 'bcrypt'\ngem 'devise'"
      end
    end
  end
end

