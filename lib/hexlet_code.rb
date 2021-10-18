# frozen_string_literal: true

require_relative 'hexlet_code/version'

# documentation comment here
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    inside_form = HexletCode::FormBuilder.new(user)
    inner = yield(inside_form).join("\n")
    HexletCode::Tag.build('form', action: url, method: 'post') { inner }
  end

  # documentation comment here
  class FormBuilder
    def initialize(user)
      @user = user
      @inputs = []
    end

    def input(name, **options)
      as = options.delete(:as)
      @inputs << HexletCode::Tag.build('label', for: name) { name.capitalize }
      element = as.to_s == 'text' ? get_textarea(name, options) : get_input(name, options)
      @inputs << element
    end

    def submit(name = 'Save')
      @inputs << HexletCode::Tag.build('input', type: 'submit', value: name)
    end

    def get_textarea(name, options)
      value = @user[name] ? (@user[name]).to_s : name.to_s
      HexletCode::Tag.build('textarea', name: name, **options) { value }
    end

    def get_input(name, options)
      value = @user[name] || ''
      HexletCode::Tag.build('input', name: name, type: 'text', value: value, **options)
    end
  end

  # documentation comment here
  module Tag
    def self.build(name, **attributes)
      atributes = atributes_to_string(attributes)
      if block_given?
        %(<#{name} #{atributes}\>\n#{yield}\n</#{name}>)
      else
        %(<#{name} #{atributes}>)
      end
    end

    def self.atributes_to_string(hash)
      hash.to_a.map do |element|
        key, val = element
        %(#{key}="#{val}")
      end.join(' ')
    end
  end
end
