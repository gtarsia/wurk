
namespace :wurk do
  namespace :bulma do
    desc "Explaining what the task does"
    task :install do
      system 'yarn add bulma'
      system 'rails generate wurk:bulma'
    end
  end
end
