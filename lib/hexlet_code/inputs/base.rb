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
    end
  end
end
