# calculator

# pseudo code
# ask the user for two numbers
# ask the user for an operation to perform
# output the result

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("Please enter the first number")
number1 = Kernel.gets().chomp().to_i

Kernel.puts("Please enter the second number")
number2 = Kernel.gets().chomp().to_i

Kernel.puts("What operations would you like to do?")
Kernel.puts("1)Add 2)Subtract 3)Multiply 4)Divide")
answer = Kernel.gets().chomp.to_i

result = case answer
            when 1 then number1 + number2
            when 2 then number1 - number2
            when 3 then number1 * number2
            when 4 then number1.to_f / number2.to_f
          end

Kernel.puts("The result is #{result}")
