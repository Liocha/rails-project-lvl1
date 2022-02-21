# frozen_string_literal: true

require_relative 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_first_form_equal
    expected = get_fixture_data('first_form.html')
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert { expected == result }
  end

  def test_second_form_equal
    expected = get_fixture_data('second_form.html')

    user = User.new name: 'rot', job: 'Bullshit'

    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, class: 'hyl'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'Wow'
    end
    assert { expected == result }
  end

  def test_field_does_not_exist_error
    user = User.new job: 'hexlet'
    assert_raises NoMethodError do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
