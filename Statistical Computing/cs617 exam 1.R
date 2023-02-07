#Ask the user to enter 5 item prices
{
  var1 = as.numeric(readline("Enter the price of item 1: "));
  var2 = as.numeric(readline("Enter the price of item 2: "));
  var3 = as.numeric(readline("Enter the price of item 3: "));
  var4 = as.numeric(readline("Enter the price of item 4: "));
  var5 = as.numeric(readline("Enter the price of item 5: "))
}

#calculate and display the sum, average, highest, and lowest item price
sum_var = sum(var1,var2,var3,var4,var5)
avg_var = sum_var/5
highest_var=max(var1,var2,var3,var4,var5)
lowest_var=min(var1,var2,var3,var4,var5)

print(paste('The sum of the prices of the 5 items is: ', sum_var))
print(paste('The average of the prices of the 5 items is: ', avg_var))
print(paste('The highest price among the 5 items is: ', highest_var))
print(paste('The lowest price among the 5 items is: ', lowest_var))

#calculate and display the discount and total after discount
if (sum_var < 50) {
  print('discount 10%')
  print (paste('The total after discount is: ', sum_var*0.9))
} else
  if (sum_var > 100 ) {
    print('discount 20%')
    print(paste('The total after discount is: ', sum_var*0.8))
  } else {
    print('discount 15%')
    print(paste('The total after discount is: ', sum_var*0.85))
  }