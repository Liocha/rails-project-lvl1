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
    type = options.delete(:as) || :string
    value = @entity[attribute_name]
    @state << { attribute_name: attribute_name, options: options, type: type, value: value }
  end

  def submit(value = 'Save')
    @state << { value: value, type: 'submit' }
  end
end
