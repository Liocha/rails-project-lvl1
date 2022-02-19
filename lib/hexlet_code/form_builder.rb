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
    value = @entity.public_send attribute_name
    @state << { attribute_name: attribute_name, options: options.except(:as), type: type, value: value }
  end

  def submit(value = 'Save')
    @state << { value: value, type: 'submit' }
  end
end
