/**
 * BREAK / CONTINUE IN DART
 * 
 * BREAK STATEMENT:
 * - Terminates the loop immediately
 * - Exits the innermost loop or switch statement
 * - Used to exit early when a condition is met
 * - Syntax: break;
 * 
 * CONTINUE STATEMENT:
 * - Skips the current iteration and continues with next iteration
 * - Jumps to the next iteration of the loop
 * - Used to skip certain iterations based on condition
 * - Syntax: continue;
 * 
 * USE CASES:
 * - break: When you want to exit loop early (e.g., found what you're looking for)
 * - continue: When you want to skip current iteration (e.g., skip invalid data)
 * 
 * LABELED BREAK/CONTINUE:
 * - Can use labels to break/continue outer loops
 * - Syntax: labelName: for (...) { break labelName; }
 */

void main() {
  print('=== BREAK STATEMENT ===\n');
  
  // Break in for loop
  print('--- Break in For Loop ---');
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break; // Exit loop when i equals 5
    }
    print('Value: $i');
  }
  print('Loop exited at i = 5');
  
  // Break in while loop
  print('\n--- Break in While Loop ---');
  int count = 1;
  while (count <= 10) {
    if (count == 7) {
      break; // Exit when count equals 7
    }
    print('Count: $count');
    count++;
  }
  
  // Break in for-in loop
  print('\n--- Break in For-In Loop ---');
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  for (int num in numbers) {
    if (num > 5) {
      break; // Exit when number is greater than 5
    }
    print('Number: $num');
  }
  
  // Practical example: Finding first even number
  print('\n--- Practical Example: Finding First Even Number ---');
  List<int> nums = [1, 3, 5, 8, 9, 10];
  for (int num in nums) {
    if (num % 2 == 0) {
      print('First even number found: $num');
      break; // Exit after finding first even number
    }
  }
  
  print('\n=== CONTINUE STATEMENT ===\n');
  
  // Continue in for loop
  print('--- Continue in For Loop (Skip Even Numbers) ---');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print('Odd number: $i');
  }
  
  // Continue in while loop
  print('\n--- Continue in While Loop (Skip Multiples of 3) ---');
  int num = 1;
  while (num <= 10) {
    if (num % 3 == 0) {
      num++;
      continue; // Skip multiples of 3
    }
    print('Number: $num');
    num++;
  }
  
  // Continue in for-in loop
  print('\n--- Continue in For-In Loop (Skip Negative Numbers) ---');
  List<int> values = [-5, -2, 0, 3, 7, -1, 9];
  for (int value in values) {
    if (value < 0) {
      continue; // Skip negative numbers
    }
    print('Positive number: $value');
  }
  
  // Practical example: Processing valid data
  print('\n--- Practical Example: Processing Valid Ages ---');
  List<int?> ages = [25, null, 30, -5, 18, null, 22];
  for (int? age in ages) {
    if (age == null || age < 0) {
      continue; // Skip invalid ages
    }
    print('Valid age: $age');
  }
  
  print('\n=== BREAK VS CONTINUE COMPARISON ===\n');
  
  print('--- Same Loop with Break vs Continue ---');
  
  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Using break
  print('\n1. Using break (stops at 5):');
  for (int num in data) {
    if (num == 5) {
      break; // Stops completely
    }
    print(num);
  }
  
  // Using continue
  print('\n2. Using continue (skips 5):');
  for (int num in data) {
    if (num == 5) {
      continue; // Skips 5, continues with rest
    }
    print(num);
  }
  
  print('\n=== LABELED BREAK ===\n');
  
  // Labeled break - breaks outer loop
  print('--- Labeled Break (Breaking Outer Loop) ---');
  outerLoop: for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        break outerLoop; // Breaks outer loop, not just inner
      }
      print('i=$i, j=$j');
    }
  }
  print('Outer loop was broken');
  
  print('\n=== LABELED CONTINUE ===\n');
  
  // Labeled continue - continues outer loop
  print('--- Labeled Continue (Continuing Outer Loop) ---');
  outerLoop: for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        continue outerLoop; // Continues outer loop iteration
      }
      print('i=$i, j=$j');
    }
  }
  
  print('\n=== PRACTICAL EXAMPLES ===\n');
  
  // Example 1: Search and break
  print('--- Example 1: Search for Value and Break ---');
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David'];
  String searchName = 'Charlie';
  
  for (String name in names) {
    if (name == searchName) {
      print('Found: $name');
      break; // Stop searching once found
    }
  }
  
  // Example 2: Filter and continue
  print('\n--- Example 2: Filter Valid Numbers ---');
  List<int?> numbers2 = [10, null, 20, -5, 30, null, 40];
  int sum = 0;
  
  for (int? num in numbers2) {
    if (num == null || num < 0) {
      continue; // Skip invalid numbers
    }
    sum += num;
    print('Added $num, Sum: $sum');
  }
  print('Final Sum: $sum');
  
  // Example 3: Nested loops with break
  print('\n--- Example 3: Finding Pair in 2D Array ---');
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  int target = 5;
  bool found = false;
  
  searchLoop: for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] == target) {
        print('Found $target at position [$i][$j]');
        found = true;
        break searchLoop; // Break both loops
      }
    }
  }
  
  if (!found) {
    print('$target not found');
  }
}

