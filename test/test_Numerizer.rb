# encoding: UTF-8
require 'helper'

class ParseNumbersTest < Test::Unit::TestCase

  def test_straight_parsing
    strings = {
      'en' => 1,
      'fem' => 5,
      'ti' => 10,
      'elleve' => 11,
      'tolv' => 12,
      'tretten' => 13,
      'fjorten' => 14,
      'femten' => 15,
      'seksten' => 16,
      'sytten' => 17,
      'atten' => 18,
      'nitten' => 19,
      'tyve' => 20,
      'syv og tyve' => 27,
      'en og tredive' => 31,
      'syv og tredive' => 37,
      'syv tredive' => 37,
      'ni og halvtreds' => 59,
      'ni og halvtres' => 59,
      'to og fyrre' => 42,
      'to og fyre' => 42,
      'en hundred' => 100,
      'et hundrede' => 100,
      'et hundred og halvtres' => 150,
      'hundred og halvtres' => 150,
      'to hundrede' => 200,
      '5 hundrede' => 500,
      'nine hundred and ninety nine' => 999,
      'one thousand' => 1000,
      'twelve hundred' => 1200,
      'one thousand two hundred' => 1_200,
      'seventeen thousand' => 17_000,
      'twentyone-thousand-four-hundred-and-seventy-three' => 21_473,
      'seventy four thousand and two' => 74_002,
      'ninety nine thousand nine hundred ninety nine' => 99_999,
      '100 thousand' => 100_000,
      'two hundred fifty thousand' => 250_000,
      'one million' => 1_000_000,
      'one million two hundred fifty thousand and seven' => 1_250_007,
      'one billion' => 1_000_000_000,
      'one billion and one' => 1_000_000_001}

    strings.each do |key, val|
      assert_equal val, Chronic::Numerizer.numerize(key).to_i
    end
  end

  def test_ordinal_strings
    {
      I18n.t(:first, scope: 'chronic.ordinals') => I18n.t(:first_suffix, scope: 'chronic.ordinals'),
      I18n.t(:second, scope: 'chronic.ordinals') => I18n.t(:second_suffix, scope: 'chronic.ordinals'),
      I18n.t(:second_day, scope: 'chronic.ordinals') => I18n.t(:second_day_suffix, scope: 'chronic.ordinals'),
      'second of may' => '2nd of may',
      'fifth' => '5th',
      'twenty third' => '23rd',
      I18n.t(:first_day_month_two, scope: 'chronic.ordinals') => I18n.t(:first_day_month_two_suffix, scope: 'chronic.ordinals')
    }.each do |key, val|
      # Use pre_normalize here instead of Numerizer directly because
      # pre_normalize deals with parsing 'second' appropriately
      assert_equal val, Chronic.pre_normalize(key)
    end
  end

  def test_edges
    assert_equal "27 Oct 2006 7:30am", Chronic::Numerizer.numerize("27 Oct 2006 7:30am")
  end
end
