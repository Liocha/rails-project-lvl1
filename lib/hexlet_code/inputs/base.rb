# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::Base
    class Base
      def initialize(element)
        @atr_name = element[:attribute_name]
        @value = element[:value] || ''
        @options = element[:options]
      end

      def get_label
        HexletCode::Tag.build('label', for: @atr_name) { @atr_name.capitalize }
      end
    end
  end
end
