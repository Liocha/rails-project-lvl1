# frozen_string_literal: true

require_relative 'hexlet_code/version'

# documentation comment here
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    inside_form = HexletCode::FormBuilder.new(user)
    inner = yield(inside_form).join("\n")
    %(<form action=\"#{url}\" method=\"post\"\>\n#{inner}\n</form>)
  end

  # documentation comment here
  class FormBuilder
    def initialize(user)
      @user = user
      @inputs = []
    end

    def input(name, **options)
      as = options.delete(:as)
      attributes = atributes_to_string(options)
      label = get_label(name)
      @inputs << label
      if as.to_s == 'text'
        @inputs << get_textarea(name, attributes)
      else
        value = @user[name] ? "value=\"#{@user[name]}\"" : ''
        @inputs << %(<input name="#{name}" type="text" #{attributes} #{value}>)
      end
    end

    def atributes_to_string(hash)
      hash.to_a.map do |element|
        key, val = element
        %(#{key}="#{val}")
      end.join(' ')
    end

    def get_label(name)
      %(<label for="#{name}"\>#{name.capitalize}</label>)
    end

    def submit(name = 'Save')
      @inputs << %(<input type="submit" value="#{name}">)
    end

    def get_textarea(name, attributes)
      value = @user[name] ? (@user[name]).to_s : name.to_s
      %(<textarea name="#{name}" #{attributes}\>#{value}</textarea>)
    end
  end

  # documentation comment here
  class Tag
    def self.build(name, **attributes)
      attribute_string = ''
      attributes.each do |attr_name, attr_val|
        attribute_string += " #{attr_name}=\"#{attr_val}\""
      end
      if block_given?
        "<#{name}#{attribute_string}>#{yield}</#{name}>"
      else
        "<#{name}#{attribute_string}>"
      end
    end

    def input(name)
      %(<input name="#{name}">)
    end
  end
end
