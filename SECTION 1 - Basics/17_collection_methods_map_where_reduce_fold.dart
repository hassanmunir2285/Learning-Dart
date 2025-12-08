/**
 * COLLECTION METHODS: map, where, reduce, fold
 * 
 * These are higher-order functions that operate on collections.
 * They provide functional programming style operations.
 * 
 * 1. map():
 *    - Transforms each element in the collection
 *    - Returns a new collection with transformed elements
 *    - Syntax: collection.map((element) => transformation)
 * 
 * 2. where():
 *    - Filters elements based on a condition
 *    - Returns a new collection with filtered elements
 *    - Syntax: collection.where((element) => condition)
 * 
 * 3. reduce():
 *    - Combines all elements into a single value
 *    - Uses a combining function
 *    - Syntax: collection.reduce((a, b) => combine)
 *    - Requires at least one element
 * 
 * 4. fold():
 *    - Similar to reduce, but with an initial value
 *    - More flexible than reduce
 *    - Syntax: collection.fold(initial, (a, b) => combine)
 *    - Can work with empty collections
 * 
 * OTHER USEFUL METHODS:
 * - forEach(): Iterates over elements
 * - any(): Checks if any element satisfies condition
 * - every(): Checks if all elements satisfy condition
 * - firstWhere(): Finds first element matching condition
 * - whereType(): Filters by type
 */

void main() {
  print('=== COLLECTION METHODS ===\n');
  
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Original list: $numbers\n');
  
  // 1. map() METHOD
  print('=== map() METHOD ===\n');
  
  // Transform each number to its square
  List<int> squares = numbers.map((n) => n * n).toList();
  print('Original: $numbers');
  print('Squares: $squares');
  
  // Transform to strings
  List<String> numberStrings = numbers.map((n) => 'Number $n').toList();
  print('As strings: $numberStrings');
  
  // Transform with conditions
  List<String> evenOdd = numbers.map((n) => n % 2 == 0 ? 'Even' : 'Odd').toList();
  print('Even/Odd: $evenOdd');
  
  // Map with index (using asMap)
  List<String> indexed = numbers.asMap().entries.map((entry) {
    return 'Index ${entry.key}: ${entry.value}';
  }).toList();
  print('With index: $indexed');
  
  // 2. where() METHOD
  print('\n=== where() METHOD ===\n');
  
  // Filter even numbers
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('Original: $numbers');
  print('Even numbers: $evens');
  
  // Filter odd numbers
  List<int> odds = numbers.where((n) => n % 2 != 0).toList();
  print('Odd numbers: $odds');
  
  // Filter numbers greater than 5
  List<int> greaterThan5 = numbers.where((n) => n > 5).toList();
  print('Numbers > 5: $greaterThan5');
  
  // Filter with multiple conditions
  List<int> between3And7 = numbers.where((n) => n >= 3 && n <= 7).toList();
  print('Numbers between 3 and 7: $between3And7');
  
  // Filter strings
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
  List<String> longNames = names.where((name) => name.length > 4).toList();
  print('Names: $names');
  print('Long names (>4 chars): $longNames');
  
  // 3. reduce() METHOD
  print('\n=== reduce() METHOD ===\n');
  
  // Sum of all numbers
  int sum = numbers.reduce((a, b) => a + b);
  print('Numbers: $numbers');
  print('Sum: $sum');
  
  // Product of all numbers
  List<int> smallNumbers = [1, 2, 3, 4];
  int product = smallNumbers.reduce((a, b) => a * b);
  print('Numbers: $smallNumbers');
  print('Product: $product');
  
  // Find maximum
  int max = numbers.reduce((a, b) => a > b ? a : b);
  print('Maximum: $max');
  
  // Find minimum
  int min = numbers.reduce((a, b) => a < b ? a : b);
  print('Minimum: $min');
  
  // Concatenate strings
  List<String> words = ['Hello', ' ', 'World', '!'];
  String sentence = words.reduce((a, b) => a + b);
  print('Words: $words');
  print('Sentence: $sentence');
  
  // 4. fold() METHOD
  print('\n=== fold() METHOD ===\n');
  
  // Sum with initial value
  int sumWithFold = numbers.fold(0, (a, b) => a + b);
  print('Numbers: $numbers');
  print('Sum (fold with 0): $sumWithFold');
  
  // Product with initial value
  int productWithFold = numbers.fold(1, (a, b) => a * b);
  print('Product (fold with 1): $productWithFold');
  
  // Count with fold
  int count = numbers.fold(0, (count, _) => count + 1);
  print('Count: $count');
  
  // String concatenation with initial
  List<String> items = ['apple', 'banana', 'cherry'];
  String result = items.fold('Fruits: ', (a, b) => '$a$b, ');
  print('Items: $items');
  print('Result: $result');
  
  // Working with empty list (fold can handle it)
  List<int> emptyList = [];
  int emptySum = emptyList.fold(0, (a, b) => a + b);
  print('Empty list sum: $emptySum');
  
  // 5. COMBINING METHODS
  print('\n=== COMBINING METHODS ===\n');
  
  // Filter, then map
  List<int> evenSquares = numbers
      .where((n) => n % 2 == 0)
      .map((n) => n * n)
      .toList();
  print('Numbers: $numbers');
  print('Even numbers squared: $evenSquares');
  
  // Map, then filter
  List<int> largeSquares = numbers
      .map((n) => n * n)
      .where((n) => n > 25)
      .toList();
  print('Squares > 25: $largeSquares');
  
  // Filter, map, then reduce
  int sumOfEvenSquares = numbers
      .where((n) => n % 2 == 0)
      .map((n) => n * n)
      .reduce((a, b) => a + b);
  print('Sum of even squares: $sumOfEvenSquares');
  
  // 6. OTHER USEFUL METHODS
  print('\n=== OTHER USEFUL METHODS ===\n');
  
  // forEach
  print('forEach:');
  numbers.forEach((n) => print('  Number: $n'));
  
  // any() - checks if any element satisfies condition
  bool hasEven = numbers.any((n) => n % 2 == 0);
  print('\nHas even numbers: $hasEven');
  
  bool hasNegative = numbers.any((n) => n < 0);
  print('Has negative numbers: $hasNegative');
  
  // every() - checks if all elements satisfy condition
  bool allPositive = numbers.every((n) => n > 0);
  print('All numbers are positive: $allPositive');
  
  bool allEven = numbers.every((n) => n % 2 == 0);
  print('All numbers are even: $allEven');
  
  // firstWhere() - finds first element matching condition
  int firstEven = numbers.firstWhere((n) => n % 2 == 0);
  print('First even number: $firstEven');
  
  // whereType() - filters by type
  List<dynamic> mixed = [1, 'hello', 2, 'world', 3.14, true];
  List<int> integers = mixed.whereType<int>().toList();
  List<String> strings = mixed.whereType<String>().toList();
  print('\nMixed list: $mixed');
  print('Integers: $integers');
  print('Strings: $strings');
  
  // 7. PRACTICAL EXAMPLES
  print('\n=== PRACTICAL EXAMPLES ===\n');
  
  // Example 1: Processing student scores
  List<Map<String, dynamic>> students = [
    {'name': 'Alice', 'score': 85},
    {'name': 'Bob', 'score': 92},
    {'name': 'Charlie', 'score': 78},
    {'name': 'David', 'score': 95}
  ];
  
  // Get names of students with score > 80
  List<String> highScorers = students
      .where((s) => s['score'] > 80)
      .map((s) => s['name'] as String)
      .toList();
  print('Students with score > 80: $highScorers');
  
  // Calculate average score
  double average = students
      .map((s) => s['score'] as int)
      .fold(0, (a, b) => a + b) / students.length;
  print('Average score: $average');
  
  // Example 2: Processing numbers
  List<int> data = [10, 20, 30, 40, 50];
  
  // Double all numbers, filter > 50, then sum
  int result2 = data
      .map((n) => n * 2)
      .where((n) => n > 50)
      .fold(0, (a, b) => a + b);
  print('\nNumbers: $data');
  print('Double, filter > 50, sum: $result2');
}

