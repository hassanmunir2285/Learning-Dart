/**
 * PATTERN MATCHING IN DART 3
 * 
 * WHAT IS PATTERN MATCHING?
 * Pattern matching is a powerful feature that allows you to match
 * and destructure data structures in a concise and expressive way.
 * 
 * KEY CONCEPTS:
 * 
 * 1. VARIABLE PATTERN:
 *    - Bind values to variables
 *    - Syntax: var (a, b) = record;
 * 
 * 2. CONSTANT PATTERN:
 *    - Match against constant values
 *    - Used in switch cases
 * 
 * 3. RECORD PATTERN:
 *    - Match and destructure records
 *    - Positional and named records
 * 
 * 4. LIST PATTERN:
 *    - Match list structures
 *    - Rest patterns (...)
 * 
 * 5. MAP PATTERN:
 *    - Match map structures
 *    - Extract key-value pairs
 * 
 * 6. OBJECT PATTERN:
 *    - Match object properties
 *    - Destructure objects
 * 
 * 7. RELATIONAL & LOGICAL PATTERNS:
 *    - Comparison patterns (>, <, >=, <=)
 *    - Logical operators (&&, ||)
 * 
 * 8. WILDCARD PATTERN:
 *    - Ignore values (_)
 * 
 * 9. IF-CASE:
 *    - Pattern matching in if statements
 * 
 * 10. SWITCH-CASE:
 *     - Pattern matching in switch expressions
 *     - Exhaustiveness checking
 */

void main() {
  print('=== PATTERN MATCHING IN DART 3 ===\n');
  
  // 1. VARIABLE PATTERN
  print('--- Variable Pattern ---');
  demonstrateVariablePattern();
  
  // 2. CONSTANT PATTERN
  print('\n--- Constant Pattern ---');
  demonstrateConstantPattern();
  
  // 3. RECORD PATTERN
  print('\n--- Record Pattern ---');
  demonstrateRecordPattern();
  
  // 4. LIST PATTERN
  print('\n--- List Pattern ---');
  demonstrateListPattern();
  
  // 5. MAP PATTERN
  print('\n--- Map Pattern ---');
  demonstrateMapPattern();
  
  // 6. OBJECT PATTERN
  print('\n--- Object Pattern ---');
  demonstrateObjectPattern();
  
  // 7. RELATIONAL PATTERN
  print('\n--- Relational Pattern ---');
  demonstrateRelationalPattern();
  
  // 8. WILDCARD PATTERN
  print('\n--- Wildcard Pattern ---');
  demonstrateWildcardPattern();
  
  // 9. IF-CASE
  print('\n--- If-Case ---');
  demonstrateIfCase();
  
  // 10. SWITCH-CASE
  print('\n--- Switch-Case ---');
  demonstrateSwitchCase();
}

/**
 * Variable pattern
 */
void demonstrateVariablePattern() {
  (String, int) user = ('John', 30);
  
  // Variable pattern: bind values to variables
  var (name, age) = user;
  print('Name: $name, Age: $age');
  
  // With type annotations
  final (String userName, int userAge) = user;
  print('Typed: $userName, $userAge');
}

/**
 * Constant pattern
 */
void demonstrateConstantPattern() {
  int value = 42;
  
  switch (value) {
    case 0:
      print('Zero');
    case 42:
      print('The answer');
    case 100:
      print('One hundred');
    default:
      print('Other');
  }
}

/**
 * Record pattern
 */
void demonstrateRecordPattern() {
  // Positional record pattern
  (String, int) getUser() => ('Alice', 25);
  var (name, age) = getUser();
  print('Record pattern: $name, $age');
  
  // Named record pattern
  ({String name, int age}) getPerson() => (name: 'Bob', age: 30);
  var (:name, :age) = getPerson();
  print('Named pattern: $name, $age');
  
  // Named pattern with renaming
  var (name: personName, age: personAge) = getPerson();
  print('Renamed: $personName, $personAge');
}

/**
 * List pattern
 */
void demonstrateListPattern() {
  var list = [1, 2, 3];
  
  // Match exact list
  if (list case [1, 2, 3]) {
    print('Exact match');
  }
  
  // Destructure list
  var [first, second, third] = list;
  print('First: $first, Second: $second, Third: $third');
  
  // Rest pattern
  var [head, ...rest] = list;
  print('Head: $head, Rest: $rest');
  
  // Rest pattern at end
  var numbers = [1, 2, 3, 4, 5];
  var [start, ..., end] = numbers;
  print('Start: $start, End: $end');
}

/**
 * Map pattern
 */
void demonstrateMapPattern() {
  var map = {'name': 'Charlie', 'age': 35};
  
  // Map pattern matching
  if (map case {'name': String name, 'age': int age}) {
    print('Map pattern: $name, $age');
  }
  
  // Destructure map
  var {'name': mapName, 'age': mapAge} = map;
  print('Destructured: $mapName, $mapAge');
}

// Person class definition
class Person {
  final String name;
  final int age;
  
  Person(this.name, this.age);
}

/**
 * Object pattern
 */
void demonstrateObjectPattern() {
  Person person = Person('David', 28);
  
  // Object pattern matching
  if (person case Person(name: var personName, age: > 25)) {
    print('Older person: $personName');
  }
  
  // Switch with object pattern
  String describe(Person p) => switch (p) {
    Person(name: var n, age: > 30) => 'Older: $n',
    Person(name: var n, age: <= 30) => 'Younger: $n',
  };
  
  print(describe(person));
}

/**
 * Relational pattern
 */
void demonstrateRelationalPattern() {
  int age = 25;
  
  String category = switch (age) {
    < 18 => 'Minor',
    >= 18 && < 65 => 'Adult',
    >= 65 => 'Senior',
    _ => 'Unknown',
  };
  
  print('Age $age: $category');
  
  // Multiple conditions
  int score = 85;
  String grade = switch (score) {
    >= 90 => 'A',
    >= 80 && < 90 => 'B',
    >= 70 && < 80 => 'C',
    _ => 'F',
  };
  
  print('Score $score: Grade $grade');
}

/**
 * Wildcard pattern
 */
void demonstrateWildcardPattern() {
  (String, int, bool) data = ('Name', 30, true);
  
  // Ignore some fields
  var (name, _, _) = data;
  print('Name only: $name');
  
  // Ignore middle values
  var (first, ..., last) = [1, 2, 3, 4, 5];
  print('First: $first, Last: $last');
}

/**
 * If-case pattern matching
 */
void demonstrateIfCase() {
  var user = ('Emma', 29);
  
  // if-case with pattern
  if (user case ('Emma', var age)) {
    print('Emma is $age years old');
  } else if (user case (var name, > 25)) {
    print('Older user: $name');
  } else {
    print('Other user');
  }
  
  // if-case with list
  var list = [1, 2, 3];
  if (list case [var first, var second, ...]) {
    print('First: $first, Second: $second');
  }
}

/**
 * Switch-case pattern matching
 */
void demonstrateSwitchCase() {
  // Switch expression with patterns
  String describe(dynamic value) => switch (value) {
    (String name, int age) => 'Record: $name, $age',
    [var a, var b, ...] => 'List: $a, $b',
    {'name': var n} => 'Map: $n',
    _ => 'Unknown',
  };
  
  print(describe(('Frank', 32)));
  print(describe([1, 2, 3]));
  print(describe({'name': 'Grace'}));
  
  // Switch statement with patterns
  var data = ('Test', 10);
  switch (data) {
    case (String s, int i) when s.length > 3:
      print('Long string: $s');
    case (String s, int i):
      print('Short string: $s');
    default:
      print('Other');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Pattern matching with guards (when clause)
String processValue(int value) => switch (value) {
  > 100 when value % 2 == 0 => 'Large even',
  > 100 => 'Large odd',
  _ => 'Small',
};

// Nested pattern matching
void nestedPatterns() {
  var data = (('Inner', 10), true);
  
  if (data case ((String s, int i), bool b)) {
    print('Nested: $s, $i, $b');
  }
}

// Pattern matching in for loops
void patternInLoops() {
  List<(String, int)> users = [
    ('Alice', 25),
    ('Bob', 30),
  ];
  
  for (var (name, age) in users) {
    print('$name: $age');
  }
}
