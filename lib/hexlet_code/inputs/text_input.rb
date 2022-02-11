# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::TextInput
    class TextInput < Base
      def render
        "<textarea cols='20' rows='40' name='#{@atr_name}'>#{@value}</textarea>\n"
      end
    end
  end
end
