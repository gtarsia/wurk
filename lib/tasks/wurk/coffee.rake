
namespace :wurk do
  namespace :coffee do
    desc "Explaining what the task does"
    task :install do
      system 'bundle add webpacker'
      system 'bundle exec rails webpacker:install'
      system 'bundle exec rails webpacker:install:coffee'
      system 'yarn upgrade coffeescript --latest'
    end
  end
end
