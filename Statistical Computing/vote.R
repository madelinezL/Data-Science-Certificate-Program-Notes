user_age = as.integer(readline("Enter the age: \n"))
#start the primary condition
if (user_age < 18) {
  print ("You are too young to vote")
} else {
  registered =  readline("Have you registered to vote? Enter yes or no \n")
  if(registered == 'yes'){
    print ("You can vote")
  } else if (registered == 'no') { #"==" means comparing, "=" means assigning 
    print ("You need to register before you can vote")
  }
  else
    print ("Wrong input...Please enter only yes or no !")
}
  