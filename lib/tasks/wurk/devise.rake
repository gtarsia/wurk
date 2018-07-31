

namespace :wurk do
  namespace :devise do
    desc "Explaining what the task does"
    task :install do
      system 'rails generate wurk:devise:gems'
      system 'bundle install'
      system 'spring stop'
      system 'rails generate devise:install > /dev/null'
      system 'rails generate devise User'
      system 'rails generate devise:views'
      system 'rails generate wurk:devise:config'
    end
    desc "Explaining what the task does"
    task :bulma do
      system 'rails generate wurk:devise:bulma'
    end
  end
end
