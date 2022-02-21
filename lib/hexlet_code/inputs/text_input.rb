# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::TextInput
    class TextInput < Base
      def initialize(element)
        super
        @params = { name: @attribute_name }.merge(@options)
      end

      def render
        input = HexletCode::Tag.build('textarea', **@params) { @value }
        "#{label}#{input}"
      end
    end
  end
end
