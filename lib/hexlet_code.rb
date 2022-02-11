# frozen_string_literal: true

require_relative 'hexlet_code/version'

# documentation comment here
module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormTemplate, 'hexlet_code/form_template.rb')
  autoload(:Inputs, 'hexlet_code/inputs.rb')

  class Error < StandardError; end

  def self.form_for(entity, url: '#')
    builder = FormBuilder.new(entity, url)
    yield builder
    FormTemplate.render(builder)
  end
end
