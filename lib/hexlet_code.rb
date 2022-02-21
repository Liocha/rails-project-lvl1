# frozen_string_literal: true

require_relative 'hexlet_code/version'

# documentation comment here
module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormTemplate, 'hexlet_code/form_template.rb')
  autoload(:Inputs, 'hexlet_code/inputs.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')

  class Error < StandardError; end

  def self.form_for(entity, **attributes)
    builder = FormBuilder.new(entity, attributes)
    yield builder
    FormTemplate.render(builder)
  end
end
