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
      attributes = options
                   .to_a
                   .map do |element|
                    key, val = element
                    %(#{key}="#{val}")
                    end
                   .join(' ')
      label = %(<label for="#{name}"\>#{name.capitalize}</label>)
      @inputs << label
      if as == 'text'
        value = @user[name] ? (@user[name]).to_s : name.to_s
        @inputs << %(<textarea name="#{name}" #{attributes}\>#{value}</textarea>)
      else
        value = @user[name] ? "value=\"#{@user[name]}\"" : ''
        @inputs << %(<input name="#{name}" #{attributes} #{value}>)
      end
    end

    def submit
      @inputs << %(<input name="commit" type="submit" value="Save">)
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
