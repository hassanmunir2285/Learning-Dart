/**
 * LOOPS IN DART: for, while, do-while
 * 
 * Loops allow you to execute a block of code repeatedly.
 * 
 * 1. FOR LOOP:
 *    - Executes code a specific number of times
 *    - Syntax: for (initialization; condition; increment) { code }
 *    - Best when you know the number of iterations
 * 
 * 2. WHILE LOOP:
 *    - Executes code while condition is true
 *    - Checks condition before execution
 *    - Syntax: while (condition) { code }
 *    - May not execute if condition is false initially
 * 
 * 3. DO-WHILE LOOP:
 *    - Executes code at least once, then checks condition
 *    - Syntax: do { code } while (condition);
 *    - Always executes at least once
 * 
 * 4. FOR-IN LOOP:
 *    - Iterates over elements in a collection
 *    - Syntax: for (element in collection) { code }
 *    - Used with Lists, Sets, Maps, Strings
 * 
 * 5. FOR-EACH LOOP:
 *    - Similar to for-in, uses forEach() method
 *    - Syntax: collection.forEach((element) { code })
 *    - Functional programming style
 */

import 'dart:io';

void main() {
  print('=== FOR LOOP ===\n');
  
  // Basic for loop
  print('--- Basic For Loop ---');
  for (int i = 1; i <= 5; i++) {
    print('Value of i: $i');
  }
  
  // For loop with step
  print('\n--- For Loop with Step ---');
  for (int i = 0; i <= 10; i += 2) {
    print('Even number: $i');
  }
  
  // Reverse for loop
  print('\n--- Reverse For Loop ---');
  for (int i = 5; i >= 1; i--) {
    print('Countdown: $i');
  }
  
  // Nested for loop
  print('\n--- Nested For Loop ---');
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print('i=$i, j=$j');
    }
  }
  
  print('\n=== WHILE LOOP ===\n');
  
  // Basic while loop
  print('--- Basic While Loop ---');
  int count = 1;
  while (count <= 5) {
    print('Count: $count');
    count++;
  }
  
  // While loop with condition
  print('\n--- While Loop with Condition ---');
  int number = 10;
  while (number > 0) {
    print('Number: $number');
    number -= 2;
  }
  
  // While loop that may not execute
  print('\n--- While Loop (May Not Execute) ---');
  int value = 10;
  while (value < 5) {
    print('This will not execute');
  }
  print('Loop condition was false, so it skipped');
  
  print('\n=== DO-WHILE LOOP ===\n');
  
  // Basic do-while loop
  print('--- Basic Do-While Loop ---');
  int counter = 1;
  do {
    print('Counter: $counter');
    counter++;
  } while (counter <= 5);
  
  // Do-while that executes at least once
  print('\n--- Do-While (Always Executes Once) ---');
  int num = 10;
  do {
    print('This executes at least once: $num');
    num++;
  } while (num < 5);
  print('Even though condition was false, it executed once');
  
  print('\n=== FOR-IN LOOP ===\n');
  
  // For-in with List
  print('--- For-In with List ---');
  List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Date'];
  for (String fruit in fruits) {
    print('Fruit: $fruit');
  }
  
  // For-in with List of numbers
  print('\n--- For-In with Numbers ---');
  List<int> numbers = [65, 60, 28, 25, 24];
  for (int age in numbers) {
    print('Age: $age');
  }
  
  // For-in with String
  print('\n--- For-In with String ---');
  String text = 'Dart';
  for (String char in text.split('')) {
    print('Character: $char');
  }
  
  print('\n=== FOR-EACH LOOP ===\n');
  
  // forEach with List
  print('--- forEach with List ---');
  List<String> items = ['Apple', 'Banana', 'Cherry'];
  items.forEach((item) {
    print('Item: $item');
  });
  
  // forEach with index (using asMap)
  print('\n--- forEach with Index ---');
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  names.asMap().forEach((index, name) {
    print('Index $index: $name');
  });
  
  // forEach with numbers
  print('\n--- forEach with Numbers ---');
  List<int> scores = [85, 90, 75, 88];
  scores.forEach((score) {
    print('Score: $score');
  });
  
  print('\n=== COMPARING LOOPS ===\n');
  
  print('--- Same Task with Different Loops ---');
  
  // Task: Print numbers 1 to 5
  
  // Using for loop
  print('\n1. Using for loop:');
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
  
  // Using while loop
  print('\n2. Using while loop:');
  int i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }
  
  // Using do-while loop
  print('\n3. Using do-while loop:');
  int j = 1;
  do {
    print(j);
    j++;
  } while (j <= 5);
  
  // Using for-in loop
  print('\n4. Using for-in loop:');
  List<int> nums = [1, 2, 3, 4, 5];
  for (int num in nums) {
    print(num);
  }
  
  // Using forEach
  print('\n5. Using forEach:');
  [1, 2, 3, 4, 5].forEach((num) {
    print(num);
  });
  
  print('\n=== PRACTICAL EXAMPLE ===\n');
  
  // User input loop
  stdout.write('Enter loop type (for/while/dowhile/forIn/forEach): ');
  String? loopType = stdin.readLineSync()?.toLowerCase();
  
  List<String> fruit = ['apple', 'mango', 'banana'];
  
  if (loopType == 'for') {
    print('\n****** Loop type is for ****');
    for (int i = 1; i <= 6; i++) {
      print('Value of i: $i');
    }
  } else if (loopType == 'while') {
    print('\n***** Loop type is while *****');
    int i = 1;
    while (i <= 6) {
      print('Value of i: $i');
      i++;
    }
  } else if (loopType == 'dowhile') {
    print('\n****** Loop type is do-while *****');
    int i = 1;
    do {
      print('Value of i: $i');
      i++;
    } while (i <= 6);
  } else if (loopType == 'forin') {
    print('\n****** Loop type is for-in ******');
    for (String a in fruit) {
      print('Fruit: $a');
    }
  } else if (loopType == 'foreach') {
    print('\n****** Loop type is forEach ******');
    fruit.forEach((s) {
      print('Fruit: $s');
    });
  } else {
    print('Not in given loop list');
  }
}
