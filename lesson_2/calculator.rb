# calculator

# pseudo code
# ask the user for two numbers
# ask the user for an operation to perform
# output the result

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("Please enter the first number")
number1 = Kernel.gets().chomp()

Kernel.puts("Please enter the second number")
number2 = Kernel.gets().chomp()

Kernel.puts("What operations would you like to do?")
Kernel.puts("1)Add 2)Subtract 3)Multiply 4)Divide")
operator = Kernel.gets().chomp

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")
