

namespace :wurk do
  namespace :devise do
    desc "Explaining what the task does"
    task :install do
      system 'rails generate devise:install > /dev/null'
      system 'rails generate devise User'
      system 'rails generate wurk:devise:bulma'
      system 'rails generate wurk:devise:config'
      # google oauth
      system 'rails g migration AddOmniauthToUsers provider:string uid:string'
      system 'rails generate wurk:devise:oauth2'
      name = Rails.application.class.parent_name.upcase
      puts 'For google oauth to work, define env vars #{name}_GOOGLE_ID and #{name}_GOOGLE_SECRET'
      puts 'They are used in config/initializers/devise.rb'
    end
  end
end
