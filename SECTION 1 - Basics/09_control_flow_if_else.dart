/**
 * CONTROL FLOW: if / else IN DART
 * 
 * Control flow statements allow you to control the execution of code
 * based on conditions.
 * 
 * IF STATEMENT:
 * - Executes code block if condition is true
 * - Syntax: if (condition) { code }
 * 
 * IF-ELSE STATEMENT:
 * - Executes one block if true, another if false
 * - Syntax: if (condition) { code1 } else { code2 }
 * 
 * IF-ELSE IF-ELSE STATEMENT:
 * - Checks multiple conditions in sequence
 * - Syntax: if (condition1) { code1 } 
 *           else if (condition2) { code2 }
 *           else { code3 }
 * 
 * NESTED IF-ELSE:
 * - if-else statements inside other if-else statements
 * - Allows complex decision making
 * 
 * CONDITIONS:
 * - Use comparison operators: ==, !=, <, >, <=, >=
 * - Use logical operators: &&, ||, !
 * - Conditions must evaluate to boolean (true/false)
 */

import 'dart:io';

void main() {
  print('=== BASIC IF STATEMENT ===\n');
  
  int number = 10;
  
  if (number > 5) {
    print('$number is greater than 5');
  }
  
  print('\n=== IF-ELSE STATEMENT ===\n');
  
  int age = 20;
  
  if (age >= 18) {
    print('You are an adult');
  } else {
    print('You are a minor');
  }
  
  print('\n=== IF-ELSE IF-ELSE STATEMENT ===\n');
  
  int score = 85;
  
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');
  } else if (score >= 60) {
    print('Grade: D');
  } else {
    print('Grade: F');
  }
  
  print('\n=== NESTED IF-ELSE ===\n');
  
  int totalNumber = 100;
  int mathNumber = 85;
  
  // First check if the score is valid
  if (mathNumber >= 0 && mathNumber <= 100) {
    // If score is 90 or above
    if (mathNumber >= 90) {
      print("Grade: A"); // Excellent grade
    }
    // If score is between 80 and 89
    else if (mathNumber >= 80) {
      print("Grade: B"); // Good grade
    }
    // If score is between 70 and 79
    else if (mathNumber >= 70) {
      print("Grade: C"); // Average grade
    }
    // If score is between 60 and 69
    else if (mathNumber >= 60) {
      print("Grade: D"); // Below average grade
    }
    // If score is below 60
    else {
      print("Grade: F"); // Fail
    }
  } else {
    print("Invalid score!"); // Score is outside 0–100 range
  }
  
  // Example with nested if-else
  var num = 10;
  if (num > 0) {
    print('$num is positive');
    if (num % 2 == 0) {
      print('$num is even');
    } else {
      print('$num is odd');
    }
  } else {
    if (num < 0) {
      print('$num is negative');
    } else {
      print('$num is zero');
    }
  }
  
  print('\n=== PRACTICAL EXAMPLE: ELECTRICITY BILL ===\n');
  
  stdout.write('Enter consumed units: ');
  String? input = stdin.readLineSync();
  
  if (input != null) {
    try {
      int consumedUnits = int.parse(input);
      int finalPrice = 0;
      
      if (consumedUnits < 100) {
        finalPrice = consumedUnits * 20;
        print('Electricity bill is $finalPrice');
        print('Consumed units: $consumedUnits');
        print('Per unit cost: 20');
      } else if (consumedUnits > 100 && consumedUnits < 200) {
        finalPrice = consumedUnits * 30;
        print('Electricity bill is $finalPrice');
        print('Consumed units: $consumedUnits');
        print('Per unit cost: 30');
      } else if (consumedUnits > 200 && consumedUnits < 300) {
        finalPrice = consumedUnits * 40;
        print('Electricity bill is $finalPrice');
        print('Consumed units: $consumedUnits');
        print('Per unit cost: 40');
      } else {
        finalPrice = consumedUnits * 50;
        print('Electricity bill is $finalPrice');
        print('Consumed units: $consumedUnits');
        print('Per unit cost: 50');
      }
    } catch (e) {
      print('Error: Invalid input. Please enter a number.');
    }
  } else {
    print('No input provided');
  }
  
  print('\n=== LOGICAL OPERATORS IN CONDITIONS ===\n');
  
  int userAge = 25;
  bool hasLicense = true;
  
  // Using && (AND)
  if (userAge >= 18 && hasLicense) {
    print('You can drive');
  } else {
    print('You cannot drive');
  }
  
  // Using || (OR)
  bool isWeekend = false;
  bool isHoliday = true;
  
  if (isWeekend || isHoliday) {
    print('It\'s a day off!');
  } else {
    print('It\'s a working day');
  }
  
  // Using ! (NOT)
  bool isRaining = false;
  
  if (!isRaining) {
    print('You can go outside');
  } else {
    print('Stay indoors');
  }
}
