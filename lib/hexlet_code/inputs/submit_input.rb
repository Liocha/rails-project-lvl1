# frozen_string_literal: true

module HexletCode
  module Inputs
    # top-level documentation comment for class HexletCode::Inputs::SubmitInput
    class SubmitInput < Base
      def initialize(element)
        super
        @params = { name: 'commit', type: 'submit', value: @value }.merge(@options)
      end

      def render
        HexletCode::Tag.build('input', **@params)
      end
    end
  end
end
