# comment
module HexletCode
  module Inputs
    class Base
      def initialize(element)
        @atr_name = element[:attribute_name]
        @value = element[:value]
      end
    end
  end
end
