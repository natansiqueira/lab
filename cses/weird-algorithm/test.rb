require './solution'
require 'minitest/autorun'

class TestSolution < MiniTest::Test
  def setup
    @solution = Solution.new
    @input = 3
    @expected = "3 10 5 16 8 4 2 1"
  end

  def test_weird
    assert_equal @expected, @solution.weird(@input)
  end
end

