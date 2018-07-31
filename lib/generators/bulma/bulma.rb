
module Wurk
  class BulmaGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def add_bulma_style
      append_to_file 'app/javascript/packs/index.js', "import 'bulma/bulma.sass'"
    end

    def add_navbar
      copy_file '_navbar.html.erb', 'app/views/layouts/_navbar.html.erb'
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<%= yield %>/ do
        "\n    <%= render 'layouts/navbar' %>"
      end
    end

    def add_flash
      copy_file '_flash.html.erb', 'app/views/layouts/_flash.html.erb'
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<%= yield %>/ do
        "\n    <%= render 'layouts/flash' %>"
      end
    end

    def set_container_section
      inject_into_file 'app/views/layouts/application.html.erb', before: /\n.*<%= yield %>/ do
        "\n    <div class=\"container\">\n      <div class=\"section\">"
      end
      inject_into_file 'app/views/layouts/application.html.erb', after: /<%= yield %>.*\n/ do
        <<-HEREDOC
      </div>
    </div>
        HEREDOC
      end
      gsub_file 'app/views/layouts/application.html.erb', /<%= yield %>/ do
        "    <%= yield %>"
      end
    end
  end
end
