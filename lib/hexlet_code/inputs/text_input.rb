# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::TextInput
    class TextInput < Base
      def initialize(element)
        super
        @label = "<label for='#{@atr_name}'>#{@atr_name.capitalize}</label>\n"
      end

      def render
        "#{@label}<textarea #{@atributes} name='#{@atr_name}'>#{@value}</textarea>\n"
      end
    end
  end
end
