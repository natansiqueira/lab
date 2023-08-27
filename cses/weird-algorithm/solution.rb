DEBUG = true

class Solution
  def weird(n)
    solution = [n]

    while n != 1
      n = n.even? ? n / 2 : n * 3 + 1
      solution.push n
    end

    return solution.join ' ' if DEBUG

    puts solution
  end

  def main
    input = gets.chomp
    weird input.to_i
  end
end

Solution.new.main unless DEBUG
