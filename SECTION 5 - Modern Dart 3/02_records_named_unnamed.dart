/**
 * RECORDS IN DART 3 (NAMED & UNNAMED)
 * 
 * WHAT ARE RECORDS?
 * Records are a new feature in Dart 3 that allow you to return
 * multiple values from a function without creating a class.
 * They're lightweight, immutable, and perfect for simple data structures.
 * 
 * KEY CONCEPTS:
 * 
 * 1. POSITIONAL RECORDS:
 *    - Access fields by position ($1, $2, etc.)
 *    - Syntax: (Type1, Type2, ...)
 *    - Example: (String, int) user = ('John', 30);
 * 
 * 2. NAMED RECORDS:
 *    - Access fields by name
 *    - Syntax: ({Type1 field1, Type2 field2})
 *    - Example: ({String name, int age}) user = (name: 'John', age: 30);
 * 
 * 3. MIXED RECORDS:
 *    - Combine positional and named fields
 *    - Positional fields come first
 *    - Syntax: (Type1, {Type2 field2})
 * 
 * 4. DESTRUCTURING:
 *    - Unpack record values into variables
 *    - Pattern matching support
 *    - Syntax: var (field1, field2) = record;
 * 
 * 5. RECORD EQUALITY:
 *    - Records are equal if all fields are equal
 *    - Structural equality (not identity)
 * 
 * USE CASES:
 * - Returning multiple values from functions
 * - Lightweight data structures
 * - Pattern matching
 * - Replacing simple classes
 */

void main() {
  print('=== RECORDS IN DART 3 ===\n');
  
  // 1. POSITIONAL RECORDS
  print('--- Positional Records ---');
  demonstratePositionalRecords();
  
  // 2. NAMED RECORDS
  print('\n--- Named Records ---');
  demonstrateNamedRecords();
  
  // 3. MIXED RECORDS
  print('\n--- Mixed Records ---');
  demonstrateMixedRecords();
  
  // 4. DESTRUCTURING
  print('\n--- Destructuring ---');
  demonstrateDestructuring();
  
  // 5. RETURNING FROM FUNCTIONS
  print('\n--- Returning from Functions ---');
  demonstrateReturningRecords();
  
  // 6. RECORD EQUALITY
  print('\n--- Record Equality ---');
  demonstrateRecordEquality();
}

/**
 * Positional records
 */
void demonstratePositionalRecords() {
  // Simple positional record
  (String, int) user = ('John', 30);
  print('Name: ${user.$1}, Age: ${user.$2}');
  
  // Multiple fields
  (String, int, bool) person = ('Jane', 25, true);
  print('Person: ${person.$1}, ${person.$2}, ${person.$3}');
  
  // Function returning positional record
  (String, int) getUser() => ('Alice', 28);
  var user2 = getUser();
  print('From function: ${user2.$1}, ${user2.$2}');
}

/**
 * Named records
 */
void demonstrateNamedRecords() {
  // Named record
  ({String name, int age}) user = (name: 'Bob', age: 35);
  print('Name: ${user.name}, Age: ${user.age}');
  
  // Function returning named record
  ({String name, int age}) getUserDetails() {
    return (name: 'Charlie', age: 40);
  }
  
  var user2 = getUserDetails();
  print('From function: ${user2.name}, ${user2.age}');
  
  // Multiple named fields
  ({String name, int age, bool isActive}) person = (
    name: 'David',
    age: 32,
    isActive: true,
  );
  print('Person: ${person.name}, ${person.age}, Active: ${person.isActive}');
}

/**
 * Mixed records (positional + named)
 */
void demonstrateMixedRecords() {
  // Mixed record: positional fields first, then named
  (String, {int age, bool isMarried}) user = (
    'Emma',
    age: 29,
    isMarried: false,
  );
  
  print('Name: ${user.$1}');
  print('Age: ${user.age}');
  print('Married: ${user.isMarried}');
  
  // Function returning mixed record
  (String, {int score}) getResult() => ('Pass', score: 85);
  var result = getResult();
  print('Result: ${result.$1}, Score: ${result.score}');
}

/**
 * Destructuring records
 */
void demonstrateDestructuring() {
  // Destructure positional record
  (String, int) user = ('Frank', 27);
  var (name, age) = user;
  print('Destructured: $name, $age');
  
  // Destructure named record
  ({String name, int age}) person = (name: 'Grace', age: 31);
  var (:name, :age) = person;
  print('Destructured named: $name, $age');
  
  // Destructure with different variable names
  var (name: userName, age: userAge) = person;
  print('Renamed: $userName, $userAge');
  
  // Destructure mixed record
  (String, {int age}) mixed = ('Henry', age: 33);
  var (mixedName, :mixedAge) = mixed;
  print('Mixed destructured: $mixedName, $mixedAge');
  
  // Destructure with wildcard
  (String, int, bool) data = ('Ivy', 26, true);
  var (firstName, _, isActive) = data;
  print('With wildcard: $firstName, Active: $isActive');
}

/**
 * Returning records from functions
 */
void demonstrateReturningRecords() {
  // Function returning positional record
  (String, int) getUser() => ('Jack', 34);
  var user = getUser();
  print('User: ${user.$1}, ${user.$2}');
  
  // Function returning named record
  ({String name, int age}) getPerson() {
    return (name: 'Kelly', age: 28);
  }
  var person = getPerson();
  print('Person: ${person.name}, ${person.age}');
  
  // Function returning mixed record
  (String, {int count}) getStats() => ('Total', count: 100);
  var stats = getStats();
  print('Stats: ${stats.$1}, ${stats.count}');
}

/**
 * Record equality
 */
void demonstrateRecordEquality() {
  // Records with same values are equal
  (String, int) record1 = ('Test', 10);
  (String, int) record2 = ('Test', 10);
  
  print('Record1 == Record2: ${record1 == record2}'); // true
  
  // Records with different values are not equal
  (String, int) record3 = ('Test', 20);
  print('Record1 == Record3: ${record1 == record3}'); // false
  
  // Named records equality
  ({String name, int age}) person1 = (name: 'John', age: 30);
  ({String name, int age}) person2 = (name: 'John', age: 30);
  print('Person1 == Person2: ${person1 == person2}'); // true
}

/**
 * ADDITIONAL EXAMPLES
 */

// Record as function parameter
void processUser((String, int) user) {
  var (name, age) = user;
  print('Processing: $name, $age');
}

// Record in collections
void recordsInCollections() {
  List<(String, int)> users = [
    ('Alice', 25),
    ('Bob', 30),
    ('Charlie', 35),
  ];
  
  for (var (name, age) in users) {
    print('$name is $age years old');
  }
}

// Record with generics
(String, T) makePair<T>(T value) => ('key', value);

// Nested records
((String, int), bool) nestedRecord = (('Name', 10), true);
