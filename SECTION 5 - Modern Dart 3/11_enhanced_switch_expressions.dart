/**
 * ENHANCED SWITCH EXPRESSIONS IN DART 3
 * 
 * WHAT ARE ENHANCED SWITCH EXPRESSIONS?
 * Enhanced switch expressions are a powerful feature in Dart 3 that
 * combine pattern matching with switch statements, allowing you to
 * write more expressive and concise code.
 * 
 * KEY FEATURES:
 * 
 * 1. SWITCH EXPRESSIONS:
 *    - Return values directly
 *    - No break statements needed
 *    - Exhaustiveness checking
 * 
 * 2. PATTERN MATCHING:
 *    - Match on structure, not just values
 *    - Destructure in cases
 *    - Type patterns
 * 
 * 3. GUARDS (WHEN CLAUSES):
 *    - Additional conditions
 *    - Complex matching logic
 *    - Conditional execution
 * 
 * 4. EXHAUSTIVENESS:
 *    - Compiler checks all cases
 *    - No default needed if exhaustive
 *    - Type safety
 * 
 * 5. MULTIPLE PATTERNS:
 *    - Match multiple values
 *    - Combine patterns
 *    - Flexible matching
 * 
 * USE CASES:
 * - State machines
 * - Type checking
 * - Data transformation
 * - Conditional logic
 */

void main() {
  print('=== ENHANCED SWITCH EXPRESSIONS ===\n');
  
  // 1. BASIC SWITCH EXPRESSION
  print('--- Basic Switch Expression ---');
  demonstrateBasicSwitchExpression();
  
  // 2. PATTERN MATCHING IN SWITCH
  print('\n--- Pattern Matching in Switch ---');
  demonstratePatternMatchingSwitch();
  
  // 3. GUARDS (WHEN CLAUSES)
  print('\n--- Guards (When Clauses) ---');
  demonstrateGuards();
  
  // 4. EXHAUSTIVENESS CHECKING
  print('\n--- Exhaustiveness Checking ---');
  demonstrateExhaustiveness();
  
  // 5. SWITCH WITH RECORDS
  print('\n--- Switch with Records ---');
  demonstrateSwitchWithRecords();
  
  // 6. SWITCH WITH OBJECTS
  print('\n--- Switch with Objects ---');
  demonstrateSwitchWithObjects();
}

/**
 * Basic switch expression
 */
void demonstrateBasicSwitchExpression() {
  int value = 2;
  
  // Switch expression returns value
  String result = switch (value) {
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    _ => 'Other',
  };
  
  print('Value $value: $result');
  
  // Can be used in assignments
  String day = switch (DateTime.now().weekday) {
    1 => 'Monday',
    2 => 'Tuesday',
    3 => 'Wednesday',
    4 => 'Thursday',
    5 => 'Friday',
    6 => 'Saturday',
    7 => 'Sunday',
    _ => 'Unknown',
  };
  
  print('Today is: $day');
}

/**
 * Pattern matching in switch
 */
void demonstratePatternMatchingSwitch() {
  // Pattern matching with sealed class
  AuthState state = AuthenticatedState(username: 'admin');
  String message = switch (state) {
    UnauthenticatedState() => 'Please sign in',
    LoadingState() => 'Loading...',
    AuthenticatedState(username: var username) => 'Welcome, $username!',
    AuthErrorState(message: var msg) => 'Error: $msg',
  };
  
  print(message);
}

sealed class AuthState {}
class UnauthenticatedState extends AuthState {}
class LoadingState extends AuthState {}
class AuthenticatedState extends AuthState {
  final String username;
  AuthenticatedState({required this.username});
}
class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

/**
 * Guards (when clauses)
 */
void demonstrateGuards() {
  int score = 85;
  
  // Switch with guards
  String grade = switch (score) {
    >= 90 => 'A',
    >= 80 && < 90 => 'B',
    >= 70 && < 80 => 'C',
    >= 60 && < 70 => 'D',
    _ => 'F',
  };
  
  print('Score $score: Grade $grade');
  
  // Pattern matching with guards
  AuthState state = AuthenticatedState(username: 'admin');
  String access = switch (state) {
    AuthenticatedState(username: var user) when user == 'admin' => 'Admin access',
    AuthenticatedState(username: var user) => 'User access: $user',
    UnauthenticatedState() => 'No access',
    LoadingState() => 'Checking...',
    AuthErrorState(message: var msg) => 'Error: $msg',
  };
  
  print('Access: $access');
}

/**
 * Exhaustiveness checking
 */
void demonstrateExhaustiveness() {
  // With sealed class, exhaustiveness is checked
  Shape shape = Circle(5.0);
  
  double area = switch (shape) {
    Circle(radius: var r) => 3.14159 * r * r,
    Rectangle(width: var w, height: var h) => w * h,
    Triangle(base: var b, height: var h) => 0.5 * b * h,
    // No default needed - all cases covered!
  };
  
  print('Area: $area');
}

sealed class Shape {}
class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}
class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);
}
class Triangle extends Shape {
  final double base;
  final double height;
  Triangle(this.base, this.height);
}

/**
 * Switch with records
 */
void demonstrateSwitchWithRecords() {
  var data = ('John', 30);
  
  String description = switch (data) {
    (String name, int age) when age < 18 => '$name is a minor',
    (String name, int age) when age >= 18 && age < 65 => '$name is an adult',
    (String name, int age) => '$name is a senior',
  };
  
  print(description);
  
  // Named records
  ({String name, int age}) person = (name: 'Jane', age: 25);
  String info = switch (person) {
    (name: var n, age: var a) when a > 20 => '$n is over 20',
    (name: var n, age: var a) => '$n is 20 or younger',
  };
  
  print(info);
}

// Person class definition
class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
}

/**
 * Switch with objects
 */
void demonstrateSwitchWithObjects() {
  Person person = Person('Bob', 35);
  
  String category = switch (person) {
    Person(name: var n, age: > 30) => 'Older: $n',
    Person(name: var n, age: <= 30) => 'Younger: $n',
    Person() => 'Unknown',
  };
  
  print(category);
}

/**
 * ADDITIONAL EXAMPLES
 */

// Switch with lists
String describeList(List<int> list) => switch (list) {
  [] => 'Empty list',
  [var x] => 'Single element: $x',
  [var x, var y] => 'Two elements: $x, $y',
  [var x, var y, ...var rest] => 'Multiple: $x, $y, and ${rest.length} more',
};

// Switch with maps
String describeMap(Map<String, dynamic> map) => switch (map) {
  {'name': String name} => 'Name: $name',
  {'age': int age} => 'Age: $age',
  {'name': String name, 'age': int age} => 'Name: $name, Age: $age',
  _ => 'Unknown map',
};

// Switch with multiple conditions
String processValue(int value) => switch (value) {
  > 100 when value % 2 == 0 => 'Large even',
  > 100 => 'Large odd',
  >= 50 && < 100 => 'Medium',
  _ => 'Small',
};

// Switch expression in function
String getStatus(int code) => switch (code) {
  200 => 'OK',
  201 => 'Created',
  404 => 'Not Found',
  500 => 'Server Error',
  >= 200 && < 300 => 'Success',
  >= 400 && < 500 => 'Client Error',
  >= 500 => 'Server Error',
  _ => 'Unknown',
};
