# frozen_string_literal: true

require 'test_heler'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_first_form_equal
    expected = get_fixture_data('first_form.html')

    my_user = Struct.new(:name, :job, keyword_init: true)
    user = my_user.new job: 'hexlet'

    resault = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal(expected, resault)
  end

  def test_second_form_equal
    expected = get_fixture_data('second_form.html')

    my_user = Struct.new(:name, :job, keyword_init: true)
    user = my_user.new name: 'rot', job: 'Bullshit'

    resault = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, class: 'hyl'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'Wow'
    end

    assert_equal(expected, resault)
  end

  def test_field_does_not_exist_error
    err = assert_raises do
      my_user = Struct.new(:name, :job, keyword_init: true)
      user = my_user.new job: 'hexlet'
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
    assert_equal 'NoMethodError', err.class.to_s
  end
end
