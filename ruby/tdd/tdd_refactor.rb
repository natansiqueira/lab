# frozen_string_literal: true

def assert(truthy)
  raise 'assert failed' unless truthy
end

class UnitTest
  def self.call
    tests = public_instance_methods.select { |method| method.to_s.start_with?('test_') }

    tests.each { |test| new.send(test) }

    puts('All tests passed!')
  end
end

class Calculator
  def self.numeric_value(arg)
    return arg if arg.is_a?(Numeric)
    raise TypeError, "#{arg} is not a numeric value" unless arg.is_a?(String)
    raise TypeError, "#{arg} is not a numeric value" unless arg.match(/^[0-9]*[.]?[0-9]+$/)

    arg.to_f
  end

  def self.sum(a, b)
    numeric_value(a) + numeric_value(b)
  end

  def self.multiply(a, b)
    numeric_value(a) * numeric_value(b)
  end
end

class CalculatorTest < UnitTest
  def test_sum
    assert Calculator.sum(1, 2) == 3
    assert Calculator.sum(5, 3) == 8
    assert Calculator.sum('3', 3) == 6
    assert Calculator.sum('333.33', 3) == 336.33
    assert Calculator.sum('30', 3) == 33
  end

  def test_multiply
    assert Calculator.multiply(2, 2) == 4
    assert Calculator.multiply(3, 3) == 9
    assert Calculator.multiply('2', 4) == 8
    assert Calculator.multiply('30', 12.4) == 372
    assert Calculator.multiply(8, '8.0') == 64
  end
end

CalculatorTest.call
