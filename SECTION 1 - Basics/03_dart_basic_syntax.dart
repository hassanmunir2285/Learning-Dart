/**
 * DART BASIC SYNTAX
 * 
 * Key Syntax Rules:
 * 
 * 1. Semicolons: Every statement must end with a semicolon (;)
 * 2. Case Sensitive: Dart is case-sensitive (main != Main)
 * 3. Entry Point: Every program must have a main() function
 * 4. Comments: 
 *    - Single line: // comment
 *    - Multi-line: /* comment */
 *    - Documentation: /// documentation comment
 * 5. Identifiers: Variable and function names
 *    - Must start with letter or underscore
 *    - Can contain letters, digits, and underscores
 *    - Cannot be keywords
 * 6. Keywords: Reserved words like void, int, String, class, etc.
 * 7. Whitespace: Spaces, tabs, and newlines are generally ignored
 * 8. Curly Braces: Used to define code blocks
 * 9. Parentheses: Used for function parameters and expressions
 * 
 * Naming Conventions:
 * - Variables: camelCase (e.g., userName, totalCount)
 * - Classes: PascalCase (e.g., UserAccount, BankAccount)
 * - Constants: lowerCamelCase or UPPER_SNAKE_CASE
 * - Private members: start with underscore (_privateVar)
 */

void main() {
  // 1. Basic Print Statement
  print('Hello, Dart!');
  
  // 2. Variables Declaration
  int age = 25;
  String name = 'John';
  double height = 5.9;
  bool isStudent = true;
  
  // 3. String Interpolation
  print('Name: $name, Age: $age');
  print('Height: ${height} feet');
  
  // 4. Arithmetic Operations
  int a = 10;
  int b = 5;
  print('Sum: ${a + b}');
  print('Difference: ${a - b}');
  print('Product: ${a * b}');
  print('Quotient: ${a / b}');
  print('Remainder: ${a % b}');
  
  // 5. Comments Examples
  // This is a single-line comment
  
  /* This is a 
     multi-line comment */
  
  /// This is a documentation comment
  /// Used for generating documentation
  
  // 6. Code Blocks
  {
    int localVar = 100;
    print('Local variable: $localVar');
  }
  // localVar is not accessible here
  
  // 7. Multiple Statements
  int x = 10;
  int y = 20;
  int sum = x + y;
  print('Sum of $x and $y is $sum');
  
  // 8. Expression vs Statement
  // Expression: returns a value
  int result = 5 + 3; // expression
  
  // Statement: performs an action
  print(result); // statement
  
  // 9. Semicolon Usage
  int num1 = 10; // required
  int num2 = 20; // required
  print(num1 + num2); // required
  
  // 10. Case Sensitivity
  String Name = 'Alice';
  String name = 'Bob';
  print('Name: $Name, name: $name'); // Different variables
}

