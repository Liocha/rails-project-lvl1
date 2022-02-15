# frozen_string_literal: true

# documentation comment for module HexletCode::Tag
module HexletCode
  # top-level documentation comment for module HexletCode::Tag
  module Tag
    def self.build(name, **attributes)
      atributes = atributes_to_string(attributes)
      if block_given?
        %(<#{name} #{atributes}\>\n#{yield}\n</#{name}>)
      else
        %(<#{name}#{atributes}>\n)
      end
    end

    def self.atributes_to_string(hash)
      hash.to_a.map do |element|
        key, val = element
        %( #{key}='#{val}')
      end.join
    end
  end
end
