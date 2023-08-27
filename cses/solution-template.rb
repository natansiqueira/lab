class Solution
  def hello
    "hello world"
  end
end

require 'minitest/autorun'

class TestSolution < MiniTest::Test
  def setup
    @solution = Solution.new
  end

  def test_hello
    assert_equal 'hello world', @solution.hello
  end
end
