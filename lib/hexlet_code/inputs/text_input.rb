# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::TextInput
    class TextInput < Base
      def initialize(element)
        super
        @params = { 'name' => @atr_name }.merge(@options)
      end

      def render
        input = HexletCode::Tag.build('textarea', **@params) { @value }
        "#{get_label}#{input}"
      end
    end
  end
end
