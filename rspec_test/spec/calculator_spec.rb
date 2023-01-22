#spec/calculator_spec.rb
require './calculator'

describe Calculator do
    describe "#add" do
      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end

      it "returns the sum of more than two numbers" do
        calculator = Calculator.new
        expect(calculator.add(2, 5, 7)).to eql(14)
      end
    end

    describe "multiply" do
        it "returns the product of two numbers" do
            calculator = Calculator.new
            expect(calculator.multiply(2,5)).to eql(10)
        end

        it "returns the product of multiple numbers" do
            calculator = Calculator.new
            expect(calculator.multiply(2,5,3)).to eql(30)
        end
    end

    describe "divide" do
        it "returns the division of two numbers" do
            calculator = Calculator.new
            expect(calculator.divide(10,5)).to eql(2)
        end
    end
    end