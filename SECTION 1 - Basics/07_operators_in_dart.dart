/**
 * OPERATORS IN DART
 * 
 * Operators are special symbols that perform operations on operands.
 * Dart supports various types of operators:
 * 
 * 1. ARITHMETIC OPERATORS:
 *    + : Addition
 *    - : Subtraction
 *    * : Multiplication
 *    / : Division (returns double)
 *    ~/ : Integer Division (returns int)
 *    % : Modulus (remainder)
 *    ++ : Increment
 *    -- : Decrement
 * 
 * 2. ASSIGNMENT OPERATORS:
 *    = : Simple assignment
 *    += : Add and assign
 *    -= : Subtract and assign
 *    *= : Multiply and assign
 *    /= : Divide and assign
 *    %= : Modulus and assign
 * 
 * 3. COMPARISON OPERATORS:
 *    == : Equal to
 *    != : Not equal to
 *    > : Greater than
 *    < : Less than
 *    >= : Greater than or equal to
 *    <= : Less than or equal to
 * 
 * 4. LOGICAL OPERATORS:
 *    && : Logical AND
 *    || : Logical OR
 *    ! : Logical NOT
 * 
 * 5. TYPE TEST OPERATORS:
 *    is : Type check
 *    is! : Negated type check
 *    as : Type cast
 * 
 * 6. BITWISE OPERATORS:
 *    & : Bitwise AND
 *    | : Bitwise OR
 *    ^ : Bitwise XOR
 *    ~ : Bitwise NOT
 *    << : Left shift
 *    >> : Right shift
 */

void main() {
  print('=== ARITHMETIC OPERATORS ===\n');
  
  int a = 10;
  int b = 3;
  
  print('a = $a, b = $b\n');
  
  // Addition
  print('Addition (a + b): ${a + b}');
  
  // Subtraction
  print('Subtraction (a - b): ${a - b}');
  
  // Multiplication
  print('Multiplication (a * b): ${a * b}');
  
  // Division (returns double)
  print('Division (a / b): ${a / b}');
  
  // Integer Division (returns int)
  print('Integer Division (a ~/ b): ${a ~/ b}');
  
  // Modulus (remainder)
  print('Modulus (a % b): ${a % b}');
  
  // Increment
  int x = 5;
  print('\nIncrement:');
  print('x = $x');
  print('x++ (post-increment): ${x++}'); // Returns 5, then x becomes 6
  print('x = $x');
  print('++x (pre-increment): ${++x}'); // x becomes 7, returns 7
  print('x = $x');
  
  // Decrement
  int y = 5;
  print('\nDecrement:');
  print('y = $y');
  print('y-- (post-decrement): ${y--}'); // Returns 5, then y becomes 4
  print('y = $y');
  print('--y (pre-decrement): ${--y}'); // y becomes 3, returns 3
  print('y = $y');
  
  print('\n=== ASSIGNMENT OPERATORS ===\n');
  
  int num = 10;
  print('Initial value: $num');
  
  num += 5; // num = num + 5
  print('After += 5: $num');
  
  num -= 3; // num = num - 3
  print('After -= 3: $num');
  
  num *= 2; // num = num * 2
  print('After *= 2: $num');
  
  num ~/= 3; // num = num ~/ 3
  print('After ~/= 3: $num');
  
  num %= 2; // num = num % 2
  print('After %= 2: $num');
  
  print('\n=== COMPARISON OPERATORS ===\n');
  
  int num1 = 10;
  int num2 = 20;
  
  print('num1 = $num1, num2 = $num2\n');
  print('num1 == num2: ${num1 == num2}');
  print('num1 != num2: ${num1 != num2}');
  print('num1 > num2: ${num1 > num2}');
  print('num1 < num2: ${num1 < num2}');
  print('num1 >= num2: ${num1 >= num2}');
  print('num1 <= num2: ${num1 <= num2}');
  
  print('\n=== LOGICAL OPERATORS ===\n');
  
  bool p = true;
  bool q = false;
  
  print('p = $p, q = $q\n');
  print('p && q (AND): ${p && q}');
  print('p || q (OR): ${p || q}');
  print('!p (NOT p): ${!p}');
  print('!q (NOT q): ${!q}');
  
  // Practical example
  int age = 25;
  bool hasLicense = true;
  
  print('\nPractical Example:');
  print('Age: $age, Has License: $hasLicense');
  print('Can drive (age >= 18 && hasLicense): ${age >= 18 && hasLicense}');
  
  print('\n=== TYPE TEST OPERATORS ===\n');
  
  var value1 = 10;
  var value2 = 'Hello';
  var value3 = 3.14;
  
  print('value1 = $value1');
  print('value1 is int: ${value1 is int}');
  print('value1 is String: ${value1 is String}');
  print('value1 is! String: ${value1 is! String}');
  
  print('\nvalue2 = $value2');
  print('value2 is String: ${value2 is String}');
  
  print('\nvalue3 = $value3');
  print('value3 is double: ${value3 is double}');
  
  // Type casting
  num number = 42;
  int integer = number as int;
  print('\nType Casting:');
  print('number (num): $number');
  print('integer (as int): $integer');
  
  print('\n=== BITWISE OPERATORS ===\n');
  
  int bit1 = 5;  // Binary: 101
  int bit2 = 3;  // Binary: 011
  
  print('bit1 = $bit1 (binary: 101)');
  print('bit2 = $bit2 (binary: 011)\n');
  
  print('bit1 & bit2 (AND): ${bit1 & bit2}'); // 001 = 1
  print('bit1 | bit2 (OR): ${bit1 | bit2}');  // 111 = 7
  print('bit1 ^ bit2 (XOR): ${bit1 ^ bit2}'); // 110 = 6
  print('~bit1 (NOT): ${~bit1}');
  print('bit1 << 1 (Left shift): ${bit1 << 1}'); // 1010 = 10
  print('bit1 >> 1 (Right shift): ${bit1 >> 1}'); // 10 = 2
  
  print('\n=== OPERATOR PRECEDENCE ===\n');
  
  int result = 2 + 3 * 4; // Multiplication first
  print('2 + 3 * 4 = $result (not 20)');
  
  int result2 = (2 + 3) * 4; // Parentheses first
  print('(2 + 3) * 4 = $result2');
  
  print('\nPrecedence order (highest to lowest):');
  print('1. () - Parentheses');
  print('2. *, /, ~/, % - Multiplication, Division');
  print('3. +, - - Addition, Subtraction');
  print('4. <, >, <=, >= - Comparison');
  print('5. ==, != - Equality');
  print('6. && - Logical AND');
  print('7. || - Logical OR');
}

