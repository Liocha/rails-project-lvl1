# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::SubmitInput
    class SubmitInput < Base
      def render
        "<input name='commit' type='submit' value='#{@value}'>\n"
      end
    end
  end
end
