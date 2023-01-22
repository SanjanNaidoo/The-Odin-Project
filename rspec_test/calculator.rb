#lib/calculator.rb

class Calculator
    def add(*args)
        sum = 0
        args.each {|num| sum += num}
        return sum
    end
    def multiply(*args)
        sum = 1
        args.each {|num| sum *= num}
        return sum
    end

    def divide(x,y)
        return x/y
    end
  end