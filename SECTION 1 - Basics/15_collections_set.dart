/**
 * COLLECTIONS: SET IN DART
 * 
 * What is a Set?
 * A Set is an unordered collection of unique items.
 * Sets do not allow duplicate values.
 * 
 * SET CHARACTERISTICS:
 * - Unordered: Items don't have a specific order
 * - Unique: No duplicate values allowed
 * - Fast lookup: Efficient for checking membership
 * - Mutable: Can add and remove items
 * - No indexing: Cannot access by index
 * 
 * SET DECLARATION:
 * 1. Literal: Set<int> set = {1, 2, 3};
 * 2. Constructor: Set<int> set = Set();
 * 3. From List: Set<int> set = Set.from([1, 2, 3]);
 * 4. Empty Set: Set<int> set = {};
 * 
 * COMMON SET OPERATIONS:
 * - Add: set.add(item)
 * - Remove: set.remove(item)
 * - Contains: set.contains(item)
 * - Length: set.length
 * - Clear: set.clear()
 * - Union: set1.union(set2)
 * - Intersection: set1.intersection(set2)
 * - Difference: set1.difference(set2)
 */

void main() {
  print('=== COLLECTIONS: SET ===\n');
  
  // 1. SET DECLARATION
  print('--- Set Declaration ---');
  
  // Literal syntax
  Set<int> numbers = {1, 2, 3, 4, 5};
  print('Set of numbers: $numbers');
  
  // Constructor syntax
  Set<String> names = Set();
  names.add('Alice');
  names.add('Bob');
  names.add('Charlie');
  print('Set of names: $names');
  
  // Set from List (removes duplicates)
  List<int> listWithDuplicates = [1, 2, 2, 3, 3, 3, 4];
  Set<int> uniqueNumbers = Set.from(listWithDuplicates);
  print('List with duplicates: $listWithDuplicates');
  print('Set (unique): $uniqueNumbers');
  
  // Empty set
  Set<String> emptySet = {};
  print('Empty set: $emptySet');
  
  // 2. SET CHARACTERISTICS
  print('\n--- Set Characteristics ---');
  
  // No duplicates
  Set<int> duplicates = {1, 2, 2, 3, 3, 3};
  print('Set with duplicates in declaration: $duplicates');
  print('Notice: Duplicates are automatically removed');
  
  // 3. ADDING AND REMOVING ELEMENTS
  print('\n--- Adding and Removing Elements ---');
  Set<String> fruits = {'Apple', 'Banana'};
  print('Original set: $fruits');
  
  // Add single element
  fruits.add('Cherry');
  print('After add("Cherry"): $fruits');
  
  // Add multiple elements
  fruits.addAll(['Date', 'Elderberry']);
  print('After addAll(["Date", "Elderberry"]): $fruits');
  
  // Remove element
  fruits.remove('Banana');
  print('After remove("Banana"): $fruits');
  
  // Remove all
  Set<String> toRemove = {'Date', 'Elderberry'};
  fruits.removeAll(toRemove);
  print('After removeAll: $fruits');
  
  // Clear set
  fruits.clear();
  print('After clear(): $fruits');
  
  // 4. SET PROPERTIES AND METHODS
  print('\n--- Set Properties and Methods ---');
  Set<int> numbers2 = {10, 20, 30, 40, 50};
  print('Set: $numbers2');
  print('Length: ${numbers2.length}');
  print('Is empty: ${numbers2.isEmpty}');
  print('Is not empty: ${numbers2.isNotEmpty}');
  print('First element: ${numbers2.first}');
  print('Last element: ${numbers2.last}');
  print('Contains 30: ${numbers2.contains(30)}');
  print('Contains 100: ${numbers2.contains(100)}');
  
  // 5. ITERATING THROUGH SETS
  print('\n--- Iterating Through Sets ---');
  Set<String> colors = {'Red', 'Green', 'Blue'};
  
  // Using for-in loop
  print('Using for-in loop:');
  for (String color in colors) {
    print('Color: $color');
  }
  
  // Using forEach
  print('\nUsing forEach:');
  colors.forEach((color) {
    print('Color: $color');
  });
  
  // 6. SET OPERATIONS
  print('\n--- Set Operations ---');
  
  Set<int> set1 = {1, 2, 3, 4, 5};
  Set<int> set2 = {4, 5, 6, 7, 8};
  
  print('Set 1: $set1');
  print('Set 2: $set2');
  
  // Union (all elements from both sets)
  Set<int> union = set1.union(set2);
  print('Union: $union');
  
  // Intersection (common elements)
  Set<int> intersection = set1.intersection(set2);
  print('Intersection: $intersection');
  
  // Difference (elements in set1 but not in set2)
  Set<int> difference = set1.difference(set2);
  print('Difference (set1 - set2): $difference');
  
  // 7. CHECKING SET RELATIONSHIPS
  print('\n--- Checking Set Relationships ---');
  
  Set<int> setA = {1, 2, 3};
  Set<int> setB = {1, 2, 3, 4, 5};
  Set<int> setC = {1, 2, 3};
  
  print('Set A: $setA');
  print('Set B: $setB');
  print('Set C: $setC');
  
  // Check if setA is subset of setB
  print('Set A is subset of Set B: ${setA.every((element) => setB.contains(element))}');
  
  // Check if sets are equal
  print('Set A equals Set C: ${setA.length == setC.length && setA.every((element) => setC.contains(element))}');
  
  // 8. CONVERTING SET TO LIST
  print('\n--- Converting Set to List ---');
  Set<int> numberSet = {3, 1, 4, 1, 5, 9, 2, 6};
  print('Set: $numberSet');
  
  List<int> numberList = numberSet.toList();
  print('List: $numberList');
  
  // Sort the list
  numberList.sort();
  print('Sorted list: $numberList');
  
  // 9. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  
  // Example 1: Finding unique values
  List<int> scores = [85, 90, 85, 88, 90, 92, 85];
  Set<int> uniqueScores = scores.toSet();
  print('All scores: $scores');
  print('Unique scores: $uniqueScores');
  
  // Example 2: Checking membership
  Set<String> allowedUsers = {'admin', 'user', 'guest'};
  String user = 'admin';
  if (allowedUsers.contains(user)) {
    print('User "$user" is allowed');
  } else {
    print('User "$user" is not allowed');
  }
  
  // Example 3: Removing duplicates from list
  List<String> namesWithDuplicates = ['Alice', 'Bob', 'Alice', 'Charlie', 'Bob'];
  List<String> uniqueNames = namesWithDuplicates.toSet().toList();
  print('Names with duplicates: $namesWithDuplicates');
  print('Unique names: $uniqueNames');
}

