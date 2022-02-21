# frozen_string_literal: true

# top-level documentation comment for module FormTemplate
module FormTemplate
  def self.render(data)
    content = data.state.map do |element|
      find_mapping(element).new(element).render
    end.join
    wrap(content, data.attributes)
  end

  def self.find_mapping(element)
    Object.const_get("HexletCode::Inputs::#{element[:type].capitalize}Input")
  end

  def self.wrap(content, attributes)
    url = attributes[:url] || '#'
    params = { method: 'post', action: url }.merge(attributes.except(:url))
    HexletCode::Tag.build('form', **params) { content }
  end
end
