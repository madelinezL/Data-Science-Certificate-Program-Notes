{
  exam1 = as.integer(readline("Enter 1st exam grade: "));
  exam2 = as.integer(readline ("Enter 2nd exam grade: "));
  exam3 = as.integer(readline ("Enter 3rd exam grade: "))
}

average_exam = (exam1 + exam2 + exam3)/3
print(paste("The average score of three exams is",average_exam))

if (average_exam >= 60) {
  print("Student Pass")
}else {
  print("Student Fail")
}
