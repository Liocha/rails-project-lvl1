# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::Base
    class Base
      def initialize(element)
        @atr_name = element[:attribute_name]
        @value = element[:value]
        @atributes = element[:options].to_a.map do |item|
          key, val = item
          %( #{key}='#{val}')
        end.join
      end
    end
  end
end
