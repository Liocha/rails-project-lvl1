module HexletCode
  module Inputs
    class TextInput < Base
      def render
        "<textarea cols='20' rows='40' name='#{@atr_name}'>#{@value}</textarea>\n"
      end
    end
  end
end
