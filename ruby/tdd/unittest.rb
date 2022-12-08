# == testing lib ==
class UnitTest
  def self.call
    tests = public_instance_methods.select do |method|
      method.to_s.start_with?('test_')
    end
    # return an array of public instance methods that starts with test_
    # test_sum
    # test_multiply

    tests.each do |test|
      self.new.send(test)

      print '.'
    end
    # for each method that starts with test_ send a message (calc in this case which inherits from unittest) 
    # with the name of the method to be invoked doing so running the assertions

    puts "\n\nAll tests passed!"
  end

  private

  def assert(truthy)
    raise 'assert failed' unless truthy
  end
end

# == implementation ==
class Calc
  def self.numeric_value(arg)
    arg.is_a?(String) ? arg.to_i : arg
  end

  def self.sum(a, b)
    numeric_value(a) + numeric_value(b)
  end

  def self.multiply(a, b)
    numeric_value(a) * numeric_value(b)
  end
end

# == tests ==
class CalcTest < UnitTest
  def test_sum
    assert Calc.sum(1, 1) == 2
    assert Calc.sum(1, 3) == 4
    assert Calc.sum('3', 3) == 6
  end

  def test_multiply
    assert Calc.multiply(2, 2) == 4
    assert Calc.multiply(3, 3) == 9
    assert Calc.multiply('2', 4) == 8
  end
end

# == running the tests ==
CalcTest.call
