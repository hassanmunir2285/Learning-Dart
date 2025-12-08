/**
 * NULL-AWARE & CONDITIONAL OPERATORS IN DART
 * 
 * NULL-AWARE OPERATORS:
 * Dart provides special operators to handle null values safely.
 * 
 * 1. ?. (Null-aware access operator):
 *    - Safely accesses properties/methods on potentially null objects
 *    - Returns null if the object is null
 *    - Example: obj?.property
 * 
 * 2. ?? (Null-coalescing operator):
 *    - Returns left operand if not null, otherwise returns right operand
 *    - Example: value ?? defaultValue
 * 
 * 3. ??= (Null-coalescing assignment):
 *    - Assigns value only if variable is null
 *    - Example: variable ??= value
 * 
 * 4. ! (Null assertion operator):
 *    - Asserts that a nullable value is not null
 *    - Throws error if value is null
 *    - Use with caution
 *    - Example: value!
 * 
 * CONDITIONAL OPERATORS:
 * 
 * 1. Ternary Operator (? :):
 *    - Shorthand for if-else statement
 *    - Syntax: condition ? valueIfTrue : valueIfFalse
 *    - Returns a value based on condition
 * 
 * 2. Cascade Operator (..):
 *    - Allows chaining multiple operations on same object
 *    - Returns the original object
 *    - Example: obj..method1()..method2()
 */

void main() {
  print('=== NULL-AWARE OPERATORS ===\n');
  
  // 1. Null-aware access operator (?.)
  print('--- Null-aware Access Operator (?.) ---');
  String? nullableString;
  String? nonNullString = 'Hello';
  
  // Safe access - returns null if object is null
  int? length1 = nullableString?.length;
  int? length2 = nonNullString?.length;
  
  print('nullableString?.length: $length1');
  print('nonNullString?.length: $length2');
  
  // Safe method call
  String? upper1 = nullableString?.toUpperCase();
  String? upper2 = nonNullString?.toUpperCase();
  
  print('nullableString?.toUpperCase(): $upper1');
  print('nonNullString?.toUpperCase(): $upper2');
  
  // 2. Null-coalescing operator (??)
  print('\n--- Null-coalescing Operator (??) ---');
  String? name;
  String? email = 'user@example.com';
  
  String displayName = name ?? 'Guest';
  String displayEmail = email ?? 'No email';
  
  print('name: $name');
  print('displayName (name ?? "Guest"): $displayName');
  print('email: $email');
  print('displayEmail (email ?? "No email"): $displayEmail');
  
  // Chaining null-coalescing
  String? value1;
  String? value2;
  String? value3 = 'Final Value';
  
  String result = value1 ?? value2 ?? value3 ?? 'Default';
  print('\nChaining: value1 ?? value2 ?? value3 ?? "Default"');
  print('Result: $result');
  
  // 3. Null-coalescing assignment (??=)
  print('\n--- Null-coalescing Assignment (??=) ---');
  String? userName;
  
  print('Before: userName = $userName');
  userName ??= 'DefaultUser'; // Only assigns if null
  print('After userName ??= "DefaultUser": $userName');
  
  userName ??= 'AnotherUser'; // Won't assign (already has value)
  print('After userName ??= "AnotherUser": $userName');
  
  // 4. Null assertion operator (!)
  print('\n--- Null Assertion Operator (!) ---');
  String? definitelyNotNull;
  definitelyNotNull = 'Hello';
  
  // Asserts that value is not null
  int len = definitelyNotNull!.length;
  print('definitelyNotNull!.length: $len');
  
  // Warning: This will throw error if value is null
  // String? maybeNull;
  // int len2 = maybeNull!.length; // Runtime error!
  
  print('\n=== CONDITIONAL OPERATORS ===\n');
  
  // 1. Ternary Operator (? :)
  print('--- Ternary Operator (? :) ---');
  
  int age = 20;
  String status = age >= 18 ? 'Adult' : 'Minor';
  print('Age: $age');
  print('Status (age >= 18 ? "Adult" : "Minor"): $status');
  
  // Nested ternary
  int score = 85;
  String grade = score >= 90 
      ? 'A' 
      : score >= 80 
          ? 'B' 
          : score >= 70 
              ? 'C' 
              : 'F';
  print('\nScore: $score');
  print('Grade: $grade');
  
  // Ternary with different types
  bool isActive = true;
  String message = isActive ? 'User is active' : 'User is inactive';
  print('\nIs Active: $isActive');
  print('Message: $message');
  
  // Ternary for assignment
  int a = 10;
  int b = 20;
  int max = a > b ? a : b;
  int min = a < b ? a : b;
  
  print('\na = $a, b = $b');
  print('Max (a > b ? a : b): $max');
  print('Min (a < b ? a : b): $min');
  
  // 2. Cascade Operator (..)
  print('\n--- Cascade Operator (..) ---');
  
  // Without cascade
  List<int> numbers1 = [];
  numbers1.add(1);
  numbers1.add(2);
  numbers1.add(3);
  print('Without cascade: $numbers1');
  
  // With cascade
  List<int> numbers2 = []
    ..add(1)
    ..add(2)
    ..add(3)
    ..sort();
  print('With cascade: $numbers2');
  
  // Cascade with StringBuffer
  StringBuffer buffer = StringBuffer()
    ..write('Hello')
    ..write(' ')
    ..write('World')
    ..write('!');
  print('StringBuffer with cascade: ${buffer.toString()}');
  
  print('\n=== COMBINING OPERATORS ===\n');
  
  // Combining null-aware and ternary
  String? userName2;
  String greeting = userName2 != null 
      ? 'Hello, $userName2!' 
      : 'Hello, Guest!';
  print('Combined: $greeting');
  
  // Using ?? with ternary
  String? email2;
  String display = email2 ?? 'No email provided';
  print('Email display: $display');
  
  // Complex example
  int? quantity;
  int defaultQuantity = 10;
  int finalQuantity = quantity ?? defaultQuantity;
  String quantityMessage = finalQuantity > 5 
      ? 'Sufficient quantity' 
      : 'Low quantity';
  
  print('\nQuantity: $quantity');
  print('Final Quantity: $finalQuantity');
  print('Message: $quantityMessage');
}
