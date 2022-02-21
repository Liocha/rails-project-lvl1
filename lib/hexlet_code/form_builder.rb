# frozen_string_literal: true

# documentation comment here
class FormBuilder
  def initialize(entity, attributes)
    @entity = entity
    @attributes = attributes
    @state = []
  end

  attr_reader :state, :attributes, :entity

  def input(attribute_name, **options)
    type = options[:as] || :string
    value = @entity.public_send attribute_name
    @state << { attribute_name: attribute_name, options: options.except(:as), type: type, value: value }
  end

  def submit(value = 'Save', **options)
    @state << { options: options, type: 'submit', value: value }
  end
end
