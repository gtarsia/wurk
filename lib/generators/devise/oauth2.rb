module Wurk
  module Devise
    class Oauth2Generator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def google_oauth2
        name = Rails.application.class.parent.name.upcase
        inject_into_file 'config/initializers/devise.rb', before: /end\Z/ do
          <<-HEREDOC
  config.omniauth :google_oauth2,
          ENV.fetch('#{name}_GOOGLE_ID') { '' }, ENV.fetch('#{name}_GOOGLE_SECRET') { '' },
          scope: 'email, profile, plus.me',
          image_aspect_ratio: 'square',
          image_size: 50
          HEREDOC
        end
      end

      # def set_routes_devise_for
      #   gsub_file 'config/routes.rb', /devise_for :users/ do
      #     "devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }"
      #   end
      # end

      # def set_user_omniauthable
      #   gsub_file 'app/models/user.rb', /devise :/ do
      #     "devise :omniauthable, :"
      #   end
      # end

      # def omniauth_callbacks_controller
      #   copy_file 'omniauth_callbacks_controller.rb', 'app/controllers/users/omniauth_callbacks_controller.rb'
      # end

      # def user_omniauth
      #   inject_into_class 'app/models/user.rb', User do
      #     <<-HEREDOC
  # def self.from_omniauth(access_token)
    # data = access_token.info.to_h.symbolize_keys
    # data[:image_url] = extract_google_image_url access_token

    # updateable_fields = %i[name image_url]
    # all_fields = (updateable_fields + [:email]).uniq

    # user = User.where(data.slice(:email)).first

    # if user
    # user.update data.slice(*updateable_fields)
    # else
    # user = User.create data.slice(*all_fields)
    # end
    # user
  # end
      #       HEREDOC
      #   end
      # end
    end
  end
end
