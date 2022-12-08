class Calculator

  def sum(x, y)
    x + y
  end

  def multiply(x, y)
    x * y
  end

end

c = Calculator.new

p c.sum(3, 3)
p c.multiply(4, 7)
