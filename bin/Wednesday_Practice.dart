import 'dart:io';

void wednesdayPractice() {
  int i = 2;
  print(i);

  print('\n');

  int totalNumber = 100;
  int mathNumber = 85;

  if (mathNumber > 90) {
    print('A+ grade');
  } else if (mathNumber > 80 && mathNumber < 89) {
    print('B grade');
  }

  /* write a programe to calculate electricity bills.
  * per unit cost varies from 20- 40 .
  * if consumed unit are less then 100 then per unit cost is 20.
  * if consumed unit are greater then 100 but less then 200 then per unit cost is 30.
  * if consumed units are greater then 200 but less then 300 then per unit cost is 40.
  * if consumed unit are greater then 300 then per unit cost is 50.
   */

  /*
  stdout.write('Enter consumed units :');
  int consumedUnits = int.parse(stdin.readLineSync()!);

  int finalPrice = 0;
  if ( consumedUnits < 100) {
    finalPrice = consumedUnits * 20;
    print('electricity bill is $finalPrice');
    print('consumed units $consumedUnits');
    print('per unit cost is 20');

  } else if (consumedUnits > 100 && consumedUnits < 200){
    finalPrice = consumedUnits * 30 ;
    print('electricity bill is $finalPrice');
    print('consumed units $consumedUnits');
    print('per unit cost is 30');

  } else if ( consumedUnits > 200 && consumedUnits < 300){
    finalPrice = consumedUnits * 40;
    print('electricity bill is $finalPrice');
    print('consumed units $consumedUnits');
    print('per unit cost is 40');

  } else {
    finalPrice = consumedUnits * 50 ;
    print('electricity bill is $finalPrice');
    print('consumed units $consumedUnits');
    print('per unit cost is 50');
  }
*/

  // Nested If-else
  //*********************************
  int score = 85; // A student's score

  // First check if the score is valid
  if (score >= 0 && score <= 100) {
    // If score is 90 or above
    if (score >= 90) {
      print("Grade: A"); // Excellent grade
    }
    // If score is between 80 and 89
    else if (score >= 80) {
      print("Grade: B"); // Good grade
    }
    // If score is between 70 and 79
    else if (score >= 70) {
      print("Grade: C"); // Average grade
    }
    // If score is between 60 and 69
    else if (score >= 60) {
      print("Grade: D"); // Below average grade
    }
    // If score is below 60
    else {
      print("Grade: F"); // Fail
    }
  } else {
    print("Invalid score!"); // Score is outside 0–100 range
  }

  // Ternary operator in Dart
  /*   In Dart, the ternary operator is made of two symbols:
            ?  :
    Its Syntax
    condition ? valueIfTrue : valueIfFalse;

   */

  // Example # 1
  //**********************************

  int age = 20; // A person's age

  // Simple ternary operator to check voting eligibility
  String eligibility = (age >= 18)
      ? "You are eligible to vote." // True case
      : "You are NOT eligible to vote."; // False case

  print(eligibility);

  /* How this works:
(age >= 18) ? "..." : "..." → If condition is true,
 return first value; else, return second value.
   */

  // Example # 2
  int number = -7; // Any integer you want to test

  // First ternary: Even or Odd
  String evenOrOdd = (number % 2 == 0)
      ? "Even" // True case: divisible by 2
      : "Odd"; // False case: not divisible by 2

  print("The number is $evenOrOdd.");

  // Nested ternary operator for category based on age
  // Example # 1
  // String category = (age < 13)
  //     ? "Child" // If under 13
  //     : (age < 18)
  //     ? "Teenager" // If between 13 and 17
  //     : "Adult"; // If 18 or above

  // print("You are a $category.");

  // Example # 2
  // Nested ternary: Positive, Negative, or Zero
  String signType = (number > 0)
      ? "Positive" // If greater than zero
      : (number < 0)
      ? "Negative" // If less than zero
      : "Zero"; // If exactly zero

  print("The number is $signType.");
  /*
  stdout.write('Enter consumed units :');
  int consumedUnits = int.parse(stdin.readLineSync()!);

  int finalPrice = 0;
  if ( consumedUnits < 100) {
    finalPrice = consumedUnits * 20;
    print('electricity bill is $finalPrice');
    print('consumed units $consumedUnits');
    print('per unit cost is 20');
*/

  //Ask the user for a username.
  //
  // If username matches "admin",
  //
  // Ask for a password.
  //
  // If password matches "1234", print "Login successful".
  //
  // Else print "Incorrect password".
  //
  // Else print "Unknown user".

  // stdout.write("Enter username: ");
  // String? username = stdin.readLineSync();
  //
  //

  var num = 10; // i= ( number =10)
  if (num > 0) { // ? "num > 0"
    print('$num is positive'); //  :( num is positive)
    if (num / 2 == 0) { // ? " num / 2 ==0"
      print('$num is even '); // : ( num is even )
    } else {
      print('$num is odd');
    }
  } else {
    if (num < 0) {
      print('$num is negative');
    } else {
      print('$num is zero');
    }
  } // String category = (age < 13)
  //     ? "Child" // If under 13
  //     : (age < 18)
  //     ? "Teenager" // If between 13 and 17
  //     : "Adult"; // If 18 or above
  if (mathNumber > 90) {
    print('A+ grade');
  } else if (mathNumber > 80 && mathNumber < 89) {
    print('B grade');
  }
  String grade = (number > 90)

  ? " A+ GRADE "
      : ( num < 80)
  ? " B grade":  " C grade";

}