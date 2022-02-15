# frozen_string_literal: true

# top-level documentation comment for module FormTemplate
module FormTemplate
  def self.render(data)
    content = data.state.map do |element|
      find_mapping(element).new(element).render
    end.join
    wrap(content, data.url)
  end

  def self.find_mapping(element)
    Object.const_get("HexletCode::Inputs::#{element[:type].capitalize}Input")
  end

  def self.wrap(content, url)
    "<form action='#{url}' method='post'>\n#{content}</form>\n"
  end
end
