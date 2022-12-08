class Calculator

  def self.sum(x, y)
    x + y
  end

  def self.multiply(x, y)
    x * y
  end

end

c = Calculator

p c.sum(3, 3)
p c.multiply(4, 7)
