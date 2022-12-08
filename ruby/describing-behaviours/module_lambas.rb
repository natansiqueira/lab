module Calculator
  
  Sum = -> (a, b) { a + b }
  Multiply = -> (a, b) { a * b } 

end

c = Calculator

p c::Sum.call(3, 3)
p c::Multiply.call(4, 7)
