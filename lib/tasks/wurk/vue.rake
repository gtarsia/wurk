
namespace :wurk do
  namespace :vue do
    desc "Explaining what the task does"
    task :install do
      system "rails generate wurk:vue:app"
    end
  end
end
