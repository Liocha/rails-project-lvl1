# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::Base
    class Base
      def initialize(element)
        @attribute_name = element[:attribute_name]
        @value = element[:value] || ''
        @options = element[:options]
      end

      def label
        HexletCode::Tag.build('label', for: @attribute_name) { @attribute_name.capitalize }
      end
    end
  end
end
