
module Wurk
  class BulmaGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def add_bulma_style
      copy_file 'base.sass', 'app/javascript/styles/base.sass'
      prepend_to_file 'app/javascript/packs/index.js', "import 'styles/base.sass'\n"
      prepend_to_file 'app/javascript/packs/index.js', "import 'bulma/bulma.sass'\n"
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<\/head>/ do
        "\n    <%= stylesheet_pack_tag 'index' %>"
      end
    end

    def set_layout
      copy_file 'layouts/application.html.erb', 'app/views/layouts/application.html.erb'
      copy_file 'layouts/_head.html.erb', 'app/views/layouts/_head.html.erb'
      copy_file 'layouts/_params.html.erb', 'app/views/layouts/_params.html.erb'
      copy_file 'layouts/_navbar.html.erb', 'app/views/layouts/_navbar.html.erb'
      copy_file 'layouts/_flash.html.erb', 'app/views/layouts/_flash.html.erb'
    end

    def set_container_section
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<%= yield %>/ do
        <<-HEREDOC

    <div class="container">
      <div class="section">
        <div class="columns is-centered">
          <div class="column is-half">
        HEREDOC
      end
      inject_into_file 'app/views/layouts/application.html.erb', after: /<%= yield %>.*\n/ do
        <<-HEREDOC
          </div>
        </div>
      </div>
    </div>
        HEREDOC
      end
      gsub_file 'app/views/layouts/application.html.erb', /\n.*<%= yield %>/ do
        "            <%= yield %>"
      end
    end

    def add_scaffold_templates
      directory 'scaffold', 'lib/templates/erb/scaffold'
    end

    def skip_generators_stylesheets
      inject_into_file 'config/application.rb', after: /config.load_defaults.*\n/ do
        <<-HEREDOC
    config.generators do |g|
      g.stylesheets false
    end
        HEREDOC
      end
    end

    def delete_default_scaffold_style
      remove_file 'app/assets/stylesheets/scaffolds.scss'
    end
  end
end
