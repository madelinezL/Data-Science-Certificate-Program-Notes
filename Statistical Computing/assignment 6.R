sum=0
average=0
n=0
p=0
repeat{
  p=as.numeric(readline("Enter the price of an item: "))
  if (p<0){
    break
  }
  sum=sum+p
  n=n+1
}
average=sum/n
print(paste("The sum of the price of the items is", sum))
print(paste("the average of the price of the items is", average))