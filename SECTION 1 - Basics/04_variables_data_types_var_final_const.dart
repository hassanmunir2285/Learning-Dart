/**
 * VARIABLES, DATA TYPES, var / final / const
 * 
 * VARIABLES:
 * Variables are containers that store data values.
 * In Dart, you must declare a variable before using it.
 * 
 * DATA TYPES IN DART:
 * 1. Numbers:
 *    - int: Integer values (e.g., 10, -5, 0)
 *    - double: Floating-point numbers (e.g., 3.14, -2.5)
 *    - num: Parent type for int and double
 * 
 * 2. Strings:
 *    - String: Sequence of characters (e.g., "Hello", 'World')
 * 
 * 3. Booleans:
 *    - bool: true or false values
 * 
 * 4. Lists:
 *    - List: Ordered collection of items
 * 
 * 5. Maps:
 *    - Map: Key-value pairs
 * 
 * 6. Dynamic:
 *    - dynamic: Can hold any type, type checking at runtime
 *    - var: Type is inferred from the value
 * 
 * VARIABLE DECLARATION KEYWORDS:
 * 
 * 1. var:
 *    - Type is inferred from the initial value
 *    - Can be reassigned
 *    - Type cannot be changed after first assignment
 * 
 * 2. final:
 *    - Runtime constant
 *    - Can only be set once
 *    - Value is determined at runtime
 *    - Cannot be reassigned
 * 
 * 3. const:
 *    - Compile-time constant
 *    - Value must be known at compile time
 *    - Cannot be reassigned
 *    - More efficient than final
 * 
 * DIFFERENCES:
 * - var: Mutable, type inferred
 * - final: Immutable, runtime value
 * - const: Immutable, compile-time value
 */

void main() {
  print('=== VARIABLES AND DATA TYPES ===\n');
  
  // 1. EXPLICIT TYPE DECLARATION
  print('--- Explicit Type Declaration ---');
  int age = 25;
  double price = 99.99;
  String name = 'Dart';
  bool isActive = true;
  
  print('Age: $age (int)');
  print('Price: $price (double)');
  print('Name: $name (String)');
  print('Is Active: $isActive (bool)');
  
  // 2. var KEYWORD (Type Inference)
  print('\n--- var Keyword (Type Inference) ---');
  var count = 10;        // Inferred as int
  var amount = 50.5;     // Inferred as double
  var message = 'Hello'; // Inferred as String
  var flag = true;       // Inferred as bool
  
  print('Count: $count (${count.runtimeType})');
  print('Amount: $amount (${amount.runtimeType})');
  print('Message: $message (${message.runtimeType})');
  print('Flag: $flag (${flag.runtimeType})');
  
  // var can be reassigned (but type cannot change)
  count = 20;  // ✅ OK
  // count = 'twenty'; // ❌ ERROR: Cannot change type
  
  // 3. final KEYWORD (Runtime Constant)
  print('\n--- final Keyword (Runtime Constant) ---');
  final currentTime = DateTime.now(); // Value determined at runtime
  final userName = 'John';
  final userAge = 30;
  
  print('Current Time: $currentTime');
  print('User Name: $userName');
  print('User Age: $userAge');
  
  // final can be initialized later (but only once)
  final int finalValue;
  finalValue = 100; // ✅ OK
  // finalValue = 200; // ❌ ERROR: Cannot reassign
  
  // 4. const KEYWORD (Compile-time Constant)
  print('\n--- const Keyword (Compile-time Constant) ---');
  const pi = 3.14159;
  const maxUsers = 1000;
  const appName = 'MyApp';
  
  print('PI: $pi');
  print('Max Users: $maxUsers');
  print('App Name: $appName');
  
  // const must be initialized immediately
  // const int constValue; // ❌ ERROR: Must be initialized
  const int constValue = 50; // ✅ OK
  
  // const cannot use runtime values
  // const currentDate = DateTime.now(); // ❌ ERROR: Not compile-time constant
  
  // 5. COMPARISON: var vs final vs const
  print('\n--- Comparison: var vs final vs const ---');
  
  // var - can be reassigned
  var mutable = 10;
  mutable = 20; // ✅ Can change
  print('var: $mutable (mutable)');
  
  // final - cannot be reassigned, runtime value
  final runtimeConst = DateTime.now().millisecondsSinceEpoch;
  // runtimeConst = 0; // ❌ Cannot reassign
  print('final: $runtimeConst (immutable, runtime value)');
  
  // const - cannot be reassigned, compile-time value
  const compileConst = 100;
  // compileConst = 200; // ❌ Cannot reassign
  print('const: $compileConst (immutable, compile-time value)');
  
  // 6. NUM TYPE (Parent of int and double)
  print('\n--- num Type (Parent of int and double) ---');
  num number1 = 10;    // Can hold int
  num number2 = 3.14;  // Can hold double
  print('Number 1: $number1 (${number1.runtimeType})');
  print('Number 2: $number2 (${number2.runtimeType})');
  
  // 7. DYNAMIC TYPE
  print('\n--- dynamic Type ---');
  dynamic dynamicVar = 10;
  print('Dynamic: $dynamicVar (${dynamicVar.runtimeType})');
  
  dynamicVar = 'Hello'; // Can change type
  print('Dynamic: $dynamicVar (${dynamicVar.runtimeType})');
  
  dynamicVar = true; // Can change type
  print('Dynamic: $dynamicVar (${dynamicVar.runtimeType})');
  
  // 8. TYPE CHECKING
  print('\n--- Type Checking ---');
  var value = 42;
  print('Value: $value');
  print('Type: ${value.runtimeType}');
  print('Is int: ${value is int}');
  print('Is String: ${value is String}');
}

