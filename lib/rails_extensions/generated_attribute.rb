module RailsExtensions
  module GeneratedAttribute
    module BulmaHelpers
      def bulma_field_class
        puts @field_type
        case @type
        when :text; 'textarea'
        when :boolean; 'checkbox'
        else 'input'
        end
      end
    end
  end
end
