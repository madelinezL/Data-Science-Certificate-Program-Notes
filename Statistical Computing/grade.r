#Ask entering a grade
score = readline("Enter the score: \n")
#Determine the grade
if (score>=90) {
  print ("Your grade is A.")
}else
   if (score>=80) {
     print ("Your grade is B.")
  }else 
     if (score >=70) {
      print ("Your grade is C. ")
     } else 
       if (score>=60) {
         print ("Your grade is D.")
     } else {
          print ("Your grade is F.")
     }


#Trying to use switch function to write the code

score = readline("Enter the score: \n")
if (score>=90) {
  var = 1
} else
  if (score>=80) {
    var = 2
  } else
    if (score >=70) {
      var = 3
    } else
      if (score >=60) {
        var = 4
      } else {
        var = 5
        }
x = switch (
            var, 
            "Your grade is A.",
            "Your grade is B.",
            "Your grade is C.",
            "Your grade is D.",
            "Your grade is F."
            )
print (x)
