module Wurk
  class GemsGenerator < Rails::Generators::Base
    def add_gems
      gem 'bcrypt'
      gem 'devise'
      gem 'omniauth-google-oauth2'
      gem 'webpacker'
    end
  end
end
