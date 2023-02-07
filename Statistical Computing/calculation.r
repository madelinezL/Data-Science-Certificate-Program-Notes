#Ask the user to enter two numbers he/she wants
{
  var1 = readline("Enter 1st number: ");
  var2 = readline ("Enter 2nd number: ")
}

# converting each value 
var1 = as.integer(var1);
var2 = as.integer(var2)

# Addition
print (paste("The Sum is: ", var1+var2))
# Subtraction
print (paste("The Subtraction is: ", var1-var2))
# Multiplication
print (paste("The Multiplication is: ", var1*var2))
# Division
print (paste("The Division is: ", var1/var2))
# Average
print (paste("The Average is: ", (var1+var2)/2))
