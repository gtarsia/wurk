module Wurk
  class Railtie < ::Rails::Railtie
    rake_tasks do
      path = File.join(File.dirname(__FILE__), '../tasks/**/*.rake')
      Dir.glob(path).each do |r|
        # puts r
        load r
      end
      # puts 'asd'
      # load 'tasks/wurk.rake'
      # Dir.glob('lib/tasks/**/*.rake').each { |r| load r}
    end
  end
end
