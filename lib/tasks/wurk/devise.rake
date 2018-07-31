

namespace :wurk do
  namespace :devise do
    desc "Explaining what the task does"
    task :install do
      system 'rails generate wurk:devise:config'
      system 'bundle install'
      system 'rails generate devise:install'
      system 'rails generate devise User'
      system 'rails generate devise:views'
    end
    desc "Explaining what the task does"
    task :bulma do
      system 'rails generate wurk:devise:bulma'
    end
  end
end
