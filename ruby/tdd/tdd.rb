# write a test that fails

# raise "assert failed" if sum(1, 2) != 3 # NoMethodError...

# define the method sum
# def sum()
#
# end
#
# raise "assert failed" if sum(1, 2) != 3 # ArgumentError: wrong number of arguments...

# define the signature of sum to receive 2 arguments
# def sum(a, b)
#
# end
#
# raise "assert failed" if sum(1, 2) != 3 # RunTimeError: assert failed
#
# Now we've entered the Red Mode

# fix the return of the method
# def sum(a, b)
#    3
# end

# raise "assert failed" if sum(1, 2) != 3
# No errors, our code works and we've entered the Green Mode

# we don't have enough code to refactor, so we write a new test case that fails
# def sum(a, b)
#    3
# end

# raise "assert failed" if sum(1, 2) != 3 # nil
# raise "assert failed" if sum(5, 3) != 8 # RunTimeError: assert failed
# Now we need to refactor to meet the new case

# def sum(a, b)
#    a + b
# end

# raise "assert failed" if sum(1, 2) != 3 # nil
# raise "assert failed" if sum(5, 3) != 8 # nil
# All tests have passed, we're in Green Mode again

# refactor of our assert
#
# # test lib
# def assert(truthy)
#     raise "assert failed" unless truthy
# end

# implementation
# def sum(a, b)
#    a + b
# end

# tests
# assert sum(1, 2) == 3 # nil
# assert sum(5, 3) == 8 # nil

# new requirement, we want to be able to pass strings to our sum method
# assert sum('3', 3) == 6 # TypeError: no implicit conversion of Integer into String

# new implementation
# def sum(a, b)
#     a + b if a.is_a?(Numeric) && b.is_a?(Numeric)
#  end

# tests
# assert sum(1, 2) == 3 # nil
# assert sum(5, 3) == 8 # nil
# assert sum('3', 3) == 6 # RuntimeError: assert failed

# refactor
# def sum(a, b)
#     a = a.to_i if a.is_a?(String)
#     b = b.to_i if b.is_a?(String)

#     a + b
# end

# tests
# assert sum(1, 2) == 3 # nil
# assert sum(5, 3) == 8 # nil
# assert sum('3', 3) == 6 # nil

# # refactor
# def numeric_value(arg)
#     arg.is_a?(String) ? arg.to_i : arg
# end

# def sum(a, b)
#     numeric_value(a) + numeric_value(b)
# end

# tests
# assert sum(1, 2) == 3 # nil
# assert sum(5, 3) == 8 # nil
# assert sum('3', 3) == 6 # nil

# test lib
def assert(truthy)
  raise "assert failed" unless truthy
end

# refactor
class Calculator
  def self.numeric_value(arg)
    if arg.is_a?(String)
      if arg.match(/^\d+\.{0,1}?\d*$/)
        arg = arg.to_f
      end
    end

    raise ArgumentError.new("#{arg} is not a numeric value") unless arg.is_a?(Numeric)

    arg
  end

  def self.sum(a, b)
    numeric_value(a) + numeric_value(b)
  end

  def self.multiply(a, b)
    numeric_value(a) * numeric_value(b)
  end
end

# tests
assert Calculator.sum(1, 2) == 3
assert Calculator.sum(5, 3) == 8
assert Calculator.sum('3', 3) == 6
assert Calculator.sum('333.33', 3) == 336.33
assert Calculator.sum('30', 3) == 33

assert Calculator.multiply(2, 2) == 4
assert Calculator.multiply(3, 3) == 9
assert Calculator.multiply('2', 4) == 8
assert Calculator.multiply('30', 12.4) == 372
assert Calculator.multiply(8, '8.0') == 64
