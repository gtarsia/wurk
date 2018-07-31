module RailsExtensions
  module GeneratedAttribute
    module BulmaHelpers
      def bulma_field_class
        case @type
        when :text; 'textarea'
        when :boolean; 'checkbox'
        else 'input'
        end
      end
    end
  end
end
