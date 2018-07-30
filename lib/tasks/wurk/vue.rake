
namespace :wurk do
  namespace :vue do
    desc "Explaining what the task does"
    task :install do
      Rails::Generators.invoke "werk:vue:app"
    end
  end
end
