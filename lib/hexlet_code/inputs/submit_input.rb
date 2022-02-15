# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::SubmitInput
    class SubmitInput < Base
      def render
        HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: @value)
      end
    end
  end
end
