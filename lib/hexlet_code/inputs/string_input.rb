# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::StringInput
    class StringInput < Base
      def initialize(element)
        super
        @params = { name: @attribute_name, type: 'text', value: @value }.merge(@options)
      end

      def render
        input = HexletCode::Tag.build('input', **@params)
        "#{label}#{input}"
      end
    end
  end
end
