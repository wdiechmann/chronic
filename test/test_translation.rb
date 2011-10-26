# encoding: UTF-8
require 'helper'

class TestTranslation < Test::Unit::TestCase

  def test_any_i18n_chronic_errors_message_with_interpolation
    key = "a key"
    string = I18n.t(:not_valid_key, key: key, scope: 'chronic.errors')
    assert_equal string, "a key is not a valid option key."
  end

  def test_a_i18n_chronic_errors_message_with_diacritic_letter
    key = "æøå"
    string = I18n.t(:første, key: key, scope: 'chronic.tests')
    assert_equal string, "æøå is not a valid option key."
  end
end