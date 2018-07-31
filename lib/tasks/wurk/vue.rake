
namespace :wurk do
  namespace :vue do
    desc "Explaining what the task does"
    task :install do
      system 'bundle add js-routes'
      system 'spring stop'
      system "rails generate wurk:vue:app"
    end
  end
end
