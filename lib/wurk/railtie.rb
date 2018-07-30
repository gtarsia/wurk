module Wurk
  class Railtie < ::Rails::Railtie
    rake_tasks do
      path = File.join(File.dirname(__FILE__), '../tasks/**/*.rake')
      Dir.glob(path).each do |r|
        load r
      end
    end
    generators do
      path = File.join(File.dirname(__FILE__), '../generators/**/*.rb')
      Dir.glob(path).each do |r|
        require r
      end
    end
  end
end
