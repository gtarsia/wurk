
namespace :wurk do
  namespace :bulma do
    desc "Explaining what the task does"
    task :install do
      system 'yarn add bulma'
      system 'yarn upgrade coffeescript --latest'
    end
  end
end
