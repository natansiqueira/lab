module Calculator

  class Sum
    def self.call(x, y)
      x + y
    end
  end

  def self.multiply(x, y)
    x * y
  end
end

c = Calculator

p c::Sum.call(3, 3)
p Calculator.multiply(4, 7)
