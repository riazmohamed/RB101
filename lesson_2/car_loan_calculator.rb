require 'pry'

# car_loan_calculator.rb

# Formula:
# m = p * (j / (1 - (1 + j)**(-n)))
      # Nomenclature
      # m = monthly payment
      # p = loan amount
      # j = monthly interest rate
      # n = loan duration in months

=begin
keywords: START, SET, GET, PRINT, READ, IF, ELSE IF, ELSE, WHILE, END, SUBPROCESS

===== casual pseudocode
  - ask the user for the loan amount required and save it to a variable "loan_amount"
  - ask the user for the desired loan duration in months and save it to the variable "loan_duration"
  - ask the user for the annual percentage rate (APR) and convert into monthly interest rate and save it in the variable "monthly_interest_rate"
  - calculate the monthly payment and save it to the variable "monthly_payment" using the formula above
  - display the monthly_payment to the user


====== Formal pseudocode

    # Given formula m = p * (j / (1 - (1 + j)**(-n)))

    GET loan amount from the user
    SET loan_amount

    GET loan duration
    SET loan_duration = loan duration in months

    GET annual percentage rate
    SET monthly_interest_rate = annual percentage rate in months

    SET monthly_payment = SUBPROCESS calculate the monthly_payment based on the given formula.

    PRINT monthly_payment
=end

# Code with intent

puts "Please enter the loan amount required > :"
loan_amount = gets.chomp.to_i

puts "Please enter the duration to repay in months > :"
loan_duration = gets.chomp.to_i

puts "Please choose the APR% that you are willing to repay > :"
annual_percentage_rate = (gets.chomp.to_f) / 100
monthly_interest_rate = annual_percentage_rate / 12

# loan calculation based on the formula
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration)))

puts "Your monthly payment is: $#{format('%.2f', monthly_payment)}"
