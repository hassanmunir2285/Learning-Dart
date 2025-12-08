/**
 * STRINGS, NUMBERS & BOOLEAN
 * 
 * STRINGS:
 * Strings are sequences of characters used to represent text.
 * In Dart, strings can be created using single quotes (') or double quotes (").
 * 
 * String Operations:
 * - Concatenation: Using + operator or string interpolation
 * - Length: .length property
 * - Substring: .substring() method
 * - Uppercase/Lowercase: .toUpperCase(), .toLowerCase()
 * - Trim: .trim() removes whitespace
 * - Split: .split() divides string into list
 * 
 * NUMBERS:
 * Dart has two types of numbers:
 * 1. int: Integer values (whole numbers)
 *    - Can be positive, negative, or zero
 *    - Examples: 10, -5, 0, 1000
 * 
 * 2. double: Floating-point numbers (decimal numbers)
 *    - Can represent fractional values
 *    - Examples: 3.14, -2.5, 0.0, 99.99
 * 
 * Number Operations:
 * - Arithmetic: +, -, *, /, %, ~/
 * - Comparison: <, >, <=, >=, ==, !=
 * - Math functions: abs(), round(), floor(), ceil()
 * 
 * BOOLEAN:
 * Boolean represents true or false values.
 * Used for logical operations and conditional statements.
 * 
 * Boolean Operations:
 * - Logical AND: &&
 * - Logical OR: ||
 * - Logical NOT: !
 */

void main() {
  print('=== STRINGS ===\n');
  
  // String Declaration
  String greeting = 'Hello';
  String name = "Dart";
  String message = 'Welcome to Dart programming';
  
  print('Greeting: $greeting');
  print('Name: $name');
  print('Message: $message');
  
  // String Concatenation
  print('\n--- String Concatenation ---');
  String fullGreeting = greeting + ' ' + name;
  print('Using + operator: $fullGreeting');
  
  // String Interpolation
  print('\n--- String Interpolation ---');
  String interpolated = '$greeting $name!';
  print('Using interpolation: $interpolated');
  print('Expression: ${greeting.toUpperCase()} ${name.toLowerCase()}');
  
  // String Properties
  print('\n--- String Properties ---');
  String text = 'Dart Programming';
  print('Text: $text');
  print('Length: ${text.length}');
  print('Uppercase: ${text.toUpperCase()}');
  print('Lowercase: ${text.toLowerCase()}');
  print('First character: ${text[0]}');
  print('Last character: ${text[text.length - 1]}');
  
  // String Methods
  print('\n--- String Methods ---');
  String sample = '  Hello World  ';
  print('Original: "$sample"');
  print('Trimmed: "${sample.trim()}"');
  print('Substring (0-5): "${sample.substring(0, 5)}"');
  print('Contains "World": ${sample.contains('World')}');
  print('Split by space: ${sample.trim().split(' ')}');
  print('Replace: ${sample.replaceAll('World', 'Dart')}');
  
  // Multi-line Strings
  print('\n--- Multi-line Strings ---');
  String multiLine = '''
  This is a
  multi-line
  string
  ''';
  print(multiLine);
  
  // Raw Strings
  print('\n--- Raw Strings ---');
  String raw = r'This is a raw string\nNo escape sequences';
  print(raw);
  
  print('\n=== NUMBERS ===\n');
  
  // Integer Operations
  print('--- Integers ---');
  int a = 10;
  int b = 3;
  print('a = $a, b = $b');
  print('Addition: ${a + b}');
  print('Subtraction: ${a - b}');
  print('Multiplication: ${a * b}');
  print('Division: ${a / b}'); // Returns double
  print('Integer Division: ${a ~/ b}'); // Returns int
  print('Modulus: ${a % b}');
  print('Power: ${a * a}');
  
  // Double Operations
  print('\n--- Doubles ---');
  double x = 10.5;
  double y = 3.2;
  print('x = $x, y = $y');
  print('Addition: ${x + y}');
  print('Subtraction: ${x - y}');
  print('Multiplication: ${x * y}');
  print('Division: ${x / y}');
  print('Modulus: ${x % y}');
  
  // Number Methods
  print('\n--- Number Methods ---');
  double num = -15.7;
  print('Number: $num');
  print('Absolute: ${num.abs()}');
  print('Round: ${num.round()}');
  print('Floor: ${num.floor()}');
  print('Ceil: ${num.ceil()}');
  print('To Int: ${num.toInt()}');
  print('To String: ${num.toString()}');
  
  // Number Comparison
  print('\n--- Number Comparison ---');
  int num1 = 10;
  int num2 = 20;
  print('$num1 < $num2: ${num1 < num2}');
  print('$num1 > $num2: ${num1 > num2}');
  print('$num1 == $num2: ${num1 == num2}');
  print('$num1 != $num2: ${num1 != num2}');
  print('$num1 <= $num2: ${num1 <= num2}');
  print('$num1 >= $num2: ${num1 >= num2}');
  
  print('\n=== BOOLEAN ===\n');
  
  // Boolean Values
  print('--- Boolean Values ---');
  bool isTrue = true;
  bool isFalse = false;
  print('isTrue: $isTrue');
  print('isFalse: $isFalse');
  
  // Boolean Operations
  print('\n--- Boolean Operations ---');
  bool condition1 = true;
  bool condition2 = false;
  
  print('condition1: $condition1');
  print('condition2: $condition2');
  print('AND (&&): ${condition1 && condition2}');
  print('OR (||): ${condition1 || condition2}');
  print('NOT condition1 (!): ${!condition1}');
  print('NOT condition2 (!): ${!condition2}');
  
  // Boolean from Comparisons
  print('\n--- Boolean from Comparisons ---');
  int age = 18;
  print('Age: $age');
  print('Is adult (>= 18): ${age >= 18}');
  print('Is teenager (13-19): ${age >= 13 && age <= 19}');
  print('Is not zero: ${age != 0}');
  
  // Type Checking
  print('\n--- Type Checking ---');
  var value1 = 10;
  var value2 = 'Hello';
  var value3 = true;
  
  print('value1 is int: ${value1 is int}');
  print('value2 is String: ${value2 is String}');
  print('value3 is bool: ${value3 is bool}');
}

