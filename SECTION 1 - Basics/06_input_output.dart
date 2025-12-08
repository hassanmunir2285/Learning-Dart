/**
 * INPUT / OUTPUT IN DART
 * 
 * OUTPUT:
 * The print() function is used to display output to the console.
 * - Automatically adds a newline at the end
 * - Can print strings, numbers, and other data types
 * 
 * stdout.write() is used for output without newline.
 * - Does not add newline automatically
 * - Useful for prompts and formatted output
 * 
 * INPUT:
 * stdin.readLineSync() is used to read input from the user.
 * - Returns a String? (nullable String)
 * - Waits for user to press Enter
 * - Returns null if input stream is closed
 * 
 * For reading numbers:
 * - int.parse() - converts String to int
 * - double.parse() - converts String to double
 * - num.parse() - converts String to num
 * 
 * IMPORT:
 * import 'dart:io'; is required for input/output operations
 */

import 'dart:io';

void main() {
  print('=== OUTPUT IN DART ===\n');
  
  // 1. Basic Print Statement
  print('--- Basic Print ---');
  print('Hello, Dart!');
  print('Welcome to Dart Programming');
  
  // 2. Printing Variables
  print('\n--- Printing Variables ---');
  String name = 'John';
  int age = 25;
  double height = 5.9;
  bool isStudent = true;
  
  print('Name: $name');
  print('Age: $age');
  print('Height: $height feet');
  print('Is Student: $isStudent');
  
  // 3. String Interpolation in Print
  print('\n--- String Interpolation ---');
  print('My name is $name and I am $age years old');
  print('Next year I will be ${age + 1} years old');
  
  // 4. Printing Multiple Values
  print('\n--- Printing Multiple Values ---');
  print('Name: $name, Age: $age, Height: $height');
  
  // 5. stdout.write() - No Newline
  print('\n--- stdout.write() (No Newline) ---');
  stdout.write('Enter your name: ');
  // Note: In actual program, you would read input here
  
  // 6. Printing Special Characters
  print('\n--- Special Characters ---');
  print('New line:\nThis is on a new line');
  print('Tab:\tThis is tabbed');
  print('Quote: "Hello"');
  print('Single quote: \'Hello\'');
  print('Backslash: \\');
  
  // 7. Printing Expressions
  print('\n--- Printing Expressions ---');
  print('Sum: ${10 + 20}');
  print('Product: ${5 * 6}');
  print('Boolean: ${10 > 5}');
  
  print('\n=== INPUT IN DART ===\n');
  
  // 8. Reading String Input
  print('--- Reading String Input ---');
  stdout.write('Enter your name: ');
  String? userName = stdin.readLineSync();
  print('Hello, $userName!');
  
  // 9. Reading Integer Input
  print('\n--- Reading Integer Input ---');
  stdout.write('Enter your age: ');
  String? ageInput = stdin.readLineSync();
  
  if (ageInput != null) {
    int userAge = int.parse(ageInput);
    print('You are $userAge years old');
    print('Next year you will be ${userAge + 1} years old');
  }
  
  // 10. Reading Double Input
  print('\n--- Reading Double Input ---');
  stdout.write('Enter your height (in feet): ');
  String? heightInput = stdin.readLineSync();
  
  if (heightInput != null) {
    double userHeight = double.parse(heightInput);
    print('Your height is $userHeight feet');
  }
  
  // 11. Safe Input Reading with Error Handling
  print('\n--- Safe Input Reading ---');
  stdout.write('Enter a number: ');
  String? numberInput = stdin.readLineSync();
  
  if (numberInput != null && numberInput.isNotEmpty) {
    try {
      int number = int.parse(numberInput);
      print('You entered: $number');
      print('Square: ${number * number}');
    } catch (e) {
      print('Error: Invalid number format');
    }
  } else {
    print('No input provided');
  }
  
  // 12. Reading Multiple Inputs
  print('\n--- Reading Multiple Inputs ---');
  stdout.write('Enter first number: ');
  String? num1Input = stdin.readLineSync();
  
  stdout.write('Enter second number: ');
  String? num2Input = stdin.readLineSync();
  
  if (num1Input != null && num2Input != null) {
    try {
      int num1 = int.parse(num1Input);
      int num2 = int.parse(num2Input);
      
      print('\nResults:');
      print('Sum: ${num1 + num2}');
      print('Difference: ${num1 - num2}');
      print('Product: ${num1 * num2}');
      if (num2 != 0) {
        print('Quotient: ${num1 / num2}');
      } else {
        print('Cannot divide by zero');
      }
    } catch (e) {
      print('Error: Invalid input');
    }
  }
  
  // 13. Using Null-Aware Operators
  print('\n--- Using Null-Aware Operators ---');
  stdout.write('Enter a value (or press Enter for default): ');
  String? input = stdin.readLineSync();
  String value = input ?? 'Default Value';
  print('Value: $value');
}

