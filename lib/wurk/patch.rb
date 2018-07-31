require 'rails/generators/generated_attribute'
require_relative './../rails_extensions/generated_attribute'

Rails::Generators::GeneratedAttribute.include RailsExtensions::GeneratedAttribute::BulmaHelpers
