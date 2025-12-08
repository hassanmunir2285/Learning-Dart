/**
 * COLLECTIONS: MAP IN DART
 * 
 * What is a Map?
 * A Map is a collection of key-value pairs.
 * Each key is unique and maps to a value.
 * 
 * MAP CHARACTERISTICS:
 * - Key-Value Pairs: Stores data as key-value pairs
 * - Unique Keys: Each key can appear only once
 * - Fast Lookup: Efficient for finding values by key
 * - Mutable: Can add, remove, and modify entries
 * - Dynamic: Can grow or shrink in size
 * 
 * MAP DECLARATION:
 * 1. Literal: Map<String, int> map = {'key1': 1, 'key2': 2};
 * 2. Constructor: Map<String, int> map = Map();
 * 3. From List: Map.fromIterable(list)
 * 4. Empty Map: Map<String, int> map = {};
 * 
 * COMMON MAP OPERATIONS:
 * - Access: map[key]
 * - Add/Update: map[key] = value
 * - Remove: map.remove(key)
 * - Contains Key: map.containsKey(key)
 * - Contains Value: map.containsValue(value)
 * - Length: map.length
 * - Keys: map.keys
 * - Values: map.values
 * - Clear: map.clear()
 */

void main() {
  print('=== COLLECTIONS: MAP ===\n');
  
  // 1. MAP DECLARATION
  print('--- Map Declaration ---');
  
  // Literal syntax
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35
  };
  print('Map of ages: $ages');
  
  // Constructor syntax
  Map<String, String> countries = Map();
  countries['USA'] = 'United States';
  countries['UK'] = 'United Kingdom';
  countries['CA'] = 'Canada';
  print('Map of countries: $countries');
  
  // Map with different types
  Map<String, dynamic> person = {
    'name': 'John',
    'age': 30,
    'isStudent': false,
    'height': 5.9
  };
  print('Map with mixed types: $person');
  
  // Empty map
  Map<String, int> emptyMap = {};
  print('Empty map: $emptyMap');
  
  // 2. ACCESSING MAP ELEMENTS
  print('\n--- Accessing Map Elements ---');
  Map<String, int> scores = {
    'Math': 95,
    'Science': 88,
    'English': 92
  };
  
  print('Map: $scores');
  print('Math score: ${scores['Math']}');
  print('Science score: ${scores['Science']}');
  print('Non-existent key: ${scores['History']}'); // Returns null
  
  // Safe access with null check
  int? historyScore = scores['History'];
  if (historyScore != null) {
    print('History score: $historyScore');
  } else {
    print('History score not found');
  }
  
  // 3. ADDING AND UPDATING ELEMENTS
  print('\n--- Adding and Updating Elements ---');
  Map<String, String> fruits = {
    'a': 'Apple',
    'b': 'Banana'
  };
  print('Original map: $fruits');
  
  // Add new entry
  fruits['c'] = 'Cherry';
  print('After adding "c": $fruits');
  
  // Update existing entry
  fruits['a'] = 'Avocado';
  print('After updating "a": $fruits');
  
  // Add multiple entries
  fruits.addAll({
    'd': 'Date',
    'e': 'Elderberry'
  });
  print('After addAll: $fruits');
  
  // 4. REMOVING ELEMENTS
  print('\n--- Removing Elements ---');
  Map<String, int> numbers = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4
  };
  print('Original map: $numbers');
  
  // Remove by key
  numbers.remove('two');
  print('After remove("two"): $numbers');
  
  // Remove where (conditional)
  numbers.removeWhere((key, value) => value > 3);
  print('After removeWhere(value > 3): $numbers');
  
  // Clear map
  Map<String, int> tempMap = Map.from(numbers);
  tempMap.clear();
  print('After clear(): $tempMap');
  
  // 5. MAP PROPERTIES AND METHODS
  print('\n--- Map Properties and Methods ---');
  Map<String, int> data = {
    'a': 1,
    'b': 2,
    'c': 3
  };
  
  print('Map: $data');
  print('Length: ${data.length}');
  print('Is empty: ${data.isEmpty}');
  print('Is not empty: ${data.isNotEmpty}');
  print('Contains key "b": ${data.containsKey('b')}');
  print('Contains value 2: ${data.containsValue(2)}');
  
  // 6. ITERATING THROUGH MAPS
  print('\n--- Iterating Through Maps ---');
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35
  };
  
  // Using forEach
  print('Using forEach:');
  ages.forEach((key, value) {
    print('$key: $value years old');
  });
  
  // Using for-in with entries
  print('\nUsing for-in with entries:');
  for (var entry in ages.entries) {
    print('${entry.key}: ${entry.value}');
  }
  
  // Using for-in with keys
  print('\nUsing for-in with keys:');
  for (String key in ages.keys) {
    print('$key: ${ages[key]}');
  }
  
  // Using for-in with values
  print('\nUsing for-in with values:');
  for (int value in ages.values) {
    print('Age: $value');
  }
  
  // 7. MAP KEYS AND VALUES
  print('\n--- Map Keys and Values ---');
  Map<String, String> capitals = {
    'USA': 'Washington',
    'UK': 'London',
    'France': 'Paris'
  };
  
  print('Map: $capitals');
  print('Keys: ${capitals.keys}');
  print('Values: ${capitals.values}');
  print('Entries: ${capitals.entries}');
  
  // Convert keys/values to list
  List<String> countryList = capitals.keys.toList();
  List<String> capitalList = capitals.values.toList();
  print('Countries list: $countryList');
  print('Capitals list: $capitalList');
  
  // 8. MAP METHODS
  print('\n--- Map Methods ---');
  Map<String, int> map1 = {'a': 1, 'b': 2};
  Map<String, int> map2 = {'c': 3, 'd': 4};
  
  print('Map 1: $map1');
  print('Map 2: $map2');
  
  // Put if absent (only adds if key doesn't exist)
  map1.putIfAbsent('a', () => 10); // Won't add (key exists)
  map1.putIfAbsent('e', () => 5); // Will add
  print('After putIfAbsent: $map1');
  
  // Update
  map1.update('a', (value) => value * 2);
  print('After update: $map1');
  
  // Update or add
  map1.update('f', (value) => value * 2, ifAbsent: () => 10);
  print('After update (or add): $map1');
  
  // 9. NESTED MAPS
  print('\n--- Nested Maps ---');
  Map<String, Map<String, int>> students = {
    'Alice': {'Math': 95, 'Science': 88},
    'Bob': {'Math': 87, 'Science': 92}
  };
  
  print('Nested map: $students');
  print('Alice Math score: ${students['Alice']?['Math']}');
  print('Bob Science score: ${students['Bob']?['Science']}');
  
  // 10. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  
  // Example 1: Word frequency counter
  List<String> words = ['apple', 'banana', 'apple', 'cherry', 'banana', 'apple'];
  Map<String, int> frequency = {};
  
  for (String word in words) {
    frequency[word] = (frequency[word] ?? 0) + 1;
  }
  print('Words: $words');
  print('Frequency: $frequency');
  
  // Example 2: Student grades
  Map<String, Map<String, int>> grades = {
    'John': {'Math': 85, 'English': 90},
    'Jane': {'Math': 92, 'English': 88}
  };
  
  print('\nStudent grades:');
  grades.forEach((student, subjects) {
    print('$student:');
    subjects.forEach((subject, grade) {
      print('  $subject: $grade');
    });
  });
}

