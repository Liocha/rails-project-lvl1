module HexletCode
  module Inputs
    class SubmitInput < Base
      def render
        "<input name='commit' type='submit' value='Save'>\n"
      end
    end
  end
end
