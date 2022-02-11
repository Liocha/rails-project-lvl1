# frozen_string_literal: true

# documentation comment here
class FormBuilder
  def initialize(entity, url)
    @entity = entity
    @url = url
    @state = []
  end

  attr_reader :state, :url, :entity

  def input(attribute_name, **options)
    type = options[:as] || :string
    value = entity[attribute_name]
    @state << { attribute_name: attribute_name, value: value, type: type }
  end

  def submit(attribute_name = '')
    @state << { attribute_name: attribute_name, type: 'submit' }
  end
end
