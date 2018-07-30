
module Werk
  class CoffeeGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    def delete_hello_coffee
      remove_file 'app/javascript/packs/hello_world.coffee'
    end

    def create_index_coffee
      create_file 'app/javascript/packs/index.coffee'
    end
  end
end
