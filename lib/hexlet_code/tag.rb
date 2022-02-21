# frozen_string_literal: true

# documentation comment for module HexletCode::Tag
module HexletCode
  # top-level documentation comment for module HexletCode::Tag
  module Tag
    def self.build(name, **attributes)
      single_html_tags = %w[!doctype area base br col embed hr img input keygen link meta param param source track wbr]
      attributes = attributes_to_string(attributes)
      if single_html_tags.include?(name)
        %(<#{name}#{attributes}>\n)
      else
        %(<#{name}#{attributes}\>#{yield}</#{name}>\n)
      end
    end

    def self.attributes_to_string(hash)
      hash.map do |key, val|
        %( #{key}='#{val}')
      end.join
    end
  end
end
