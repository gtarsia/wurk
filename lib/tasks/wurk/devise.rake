

namespace :wurk do
  namespace :devise do
    desc "Explaining what the task does"
    task :install do
      system 'rails generate wurk:devise:gems'
      system 'bundle install'
      system 'spring stop'
      system 'rails generate devise:install > /dev/null'
      system 'rails generate devise User'
      system 'rails generate wurk:devise:bulma'
      system 'rails generate wurk:devise:config'
    end
  end
end
