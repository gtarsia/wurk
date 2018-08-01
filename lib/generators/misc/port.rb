module Wurk
  class PortGenerator < Rails::Generators::Base
    def reset_port
      port = Wurk::RandomPort.get
      inject_into_file "config/environments/development.rb", before: /end\Z/ do
        "\n  # generated by wurk:devise:config\n  config.action_mailer.default_url_options = { host: 'localhost', port: #{port} }\n"
      end
      gsub_file 'config/puma.rb', /ENV.fetch\("PORT"\) { 3000 }/ do
        "ENV.fetch(\"PORT\") { #{port} }"
      end
    end
  end
end