/**
 * COLLECTIONS: LIST IN DART
 * 
 * What is a List?
 * A List is an ordered collection of items.
 * Lists in Dart are similar to arrays in other languages.
 * 
 * LIST CHARACTERISTICS:
 * - Ordered: Items maintain their insertion order
 * - Indexed: Access items by index (0-based)
 * - Mutable: Can add, remove, and modify items
 * - Duplicates: Can contain duplicate values
 * - Dynamic: Can grow or shrink in size
 * 
 * LIST DECLARATION:
 * 1. Fixed-length List: List<int> list = List.filled(5, 0);
 * 2. Growable List: List<int> list = [1, 2, 3];
 * 3. Empty List: List<int> list = [];
 * 4. List with type: List<String> names = ['Alice', 'Bob'];
 * 5. Dynamic List: List<dynamic> mixed = [1, 'Hello', true];
 * 
 * COMMON LIST OPERATIONS:
 * - Access: list[index]
 * - Add: list.add(item)
 * - Insert: list.insert(index, item)
 * - Remove: list.remove(item)
 * - Remove at: list.removeAt(index)
 * - Length: list.length
 * - Contains: list.contains(item)
 * - Index of: list.indexOf(item)
 * - Sort: list.sort()
 * - Reverse: list.reversed
 */

import 'dart:io';

void main() {
  print('=== COLLECTIONS: LIST ===\n');
  
  // 1. LIST DECLARATION
  print('--- List Declaration ---');
  
  // Fixed-length list
  List<int> fixedList = List.filled(3, 0);
  print('Fixed-length list: $fixedList');
  
  // Growable list with values
  List<int> numbers = [10, 20, 30];
  print('Growable list: $numbers');
  
  // List of strings
  List<String> names = ['munir', 'naheed', 'hassan'];
  print('String list: $names');
  
  // List of booleans
  List<bool> booleanList = [true, false, true];
  print('Boolean list: $booleanList');
  
  // Empty list
  List<int> emptyList = [];
  print('Empty list: $emptyList');
  
  // Dynamic list (mixed types)
  List<dynamic> mixedList = [1, 'Hello', 3.14, true];
  print('Mixed list: $mixedList');
  
  // 2. ACCESSING LIST ELEMENTS
  print('\n--- Accessing List Elements ---');
  List<int> scores = [10, 20, 30];
  print('List: $scores');
  print('Length: ${scores.length}');
  print('First element (index 0): ${scores[0]}');
  print('Second element (index 1): ${scores[1]}');
  print('Last element: ${scores[scores.length - 1]}');
  
  // 3. ITERATING THROUGH LISTS
  print('\n--- Iterating Through Lists ---');
  
  // Using for loop with index
  print('Using for loop with index:');
  for (int i = 0; i < scores.length; i++) {
    print('Index $i: ${scores[i]}');
  }
  
  // Using for-in loop
  print('\nUsing for-in loop:');
  for (int score in scores) {
    print('Score: $score');
  }
  
  // Using forEach
  print('\nUsing forEach:');
  scores.forEach((score) {
    print('Score: $score');
  });
  
  // 4. LIST OPERATIONS
  print('\n--- List Operations ---');
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print('Original list: $fruits');
  
  // Add element
  fruits.add('Date');
  print('After add("Date"): $fruits');
  
  // Insert at specific index
  fruits.insert(1, 'Avocado');
  print('After insert(1, "Avocado"): $fruits');
  
  // Remove element
  fruits.remove('Banana');
  print('After remove("Banana"): $fruits');
  
  // Remove at index
  fruits.removeAt(0);
  print('After removeAt(0): $fruits');
  
  // Remove last
  fruits.removeLast();
  print('After removeLast(): $fruits');
  
  // 5. LIST PROPERTIES AND METHODS
  print('\n--- List Properties and Methods ---');
  List<int> numbers2 = [5, 2, 8, 1, 9];
  print('List: $numbers2');
  print('Length: ${numbers2.length}');
  print('Is empty: ${numbers2.isEmpty}');
  print('Is not empty: ${numbers2.isNotEmpty}');
  print('First element: ${numbers2.first}');
  print('Last element: ${numbers2.last}');
  print('Contains 8: ${numbers2.contains(8)}');
  print('Index of 8: ${numbers2.indexOf(8)}');
  
  // 6. SORTING AND REVERSING
  print('\n--- Sorting and Reversing ---');
  List<int> unsorted = [5, 2, 8, 1, 9];
  print('Original: $unsorted');
  
  // Sort (modifies original)
  List<int> sorted = List.from(unsorted);
  sorted.sort();
  print('Sorted: $sorted');
  
  // Reverse (returns iterable)
  List<int> reversed = unsorted.reversed.toList();
  print('Reversed: $reversed');
  
  // 7. LIST METHODS
  print('\n--- More List Methods ---');
  List<String> items = ['Apple', 'Banana', 'Cherry', 'Apple'];
  print('List: $items');
  
  // Index of
  print('Index of "Banana": ${items.indexOf("Banana")}');
  print('Last index of "Apple": ${items.lastIndexOf("Apple")}');
  
  // Sublist
  List<String> sublist = items.sublist(1, 3);
  print('Sublist(1, 3): $sublist');
  
  // Join
  String joined = items.join(', ');
  print('Joined: $joined');
  
  // 8. LIST WITH USER INPUT
  print('\n--- List with User Input ---');
  List<int> ages = [];
  stdout.write('Enter number of family members: ');
  String? input = stdin.readLineSync();
  
  if (input != null) {
    try {
      int count = int.parse(input);
      
      for (int i = 1; i <= count; i++) {
        stdout.write('Enter age of member $i: ');
        String? ageInput = stdin.readLineSync();
        if (ageInput != null) {
          ages.add(int.parse(ageInput));
        }
      }
      
      print('Ages entered: $ages');
      print('Total members: ${ages.length}');
      print('Average age: ${ages.reduce((a, b) => a + b) / ages.length}');
    } catch (e) {
      print('Error: Invalid input');
    }
  }
  
  // 9. LIST OF LISTS (2D List)
  print('\n--- 2D List (List of Lists) ---');
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print('2D List:');
  for (List<int> row in matrix) {
    print(row);
  }
  
  print('Element at [1][2]: ${matrix[1][2]}');
}
