
namespace :wurk do
  desc "Explaining what the task does"
  task :install do
    system "rake wurk:webpacker:install"
    system "rake wurk:devise:install"
    system "rake wurk:bulma:install"
    system "rake wurk:vue:install"
    system "rails generate wurk:port"
  end
end
