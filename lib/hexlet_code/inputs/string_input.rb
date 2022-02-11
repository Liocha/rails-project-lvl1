# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::StringInput
    class StringInput < Base
      def initialize(element)
        super
        @label = "<label for='#{@atr_name}'>#{@atr_name}</label>\n"
      end

      def render
        if @value.nil?
          "#{@label}<input name='#{@atr_name}' type='text'>\n"
        else
          "#{@label}<input name='#{@atr_name}' type='text' value='#{@value}'>\n"
        end
      end
    end
  end
end
