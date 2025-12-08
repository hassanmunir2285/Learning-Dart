/**
 * MODULES / LIBRARY STRUCTURE IN DART
 * 
 * WHAT IS A LIBRARY?
 * A library is a collection of code that can be reused.
 * In Dart, every file is a library.
 * 
 * KEY CONCEPTS:
 * 
 * 1. LIBRARY DECLARATION:
 *    - Syntax: library library_name;
 *    - Optional but recommended for documentation
 *    - Usually placed at top of file
 * 
 * 2. IMPORT STATEMENTS:
 *    - Import code from other libraries
 *    - Syntax: import 'path/to/file.dart';
 *    - Can use 'as' for namespace
 *    - Can use 'show' to import specific items
 *    - Can use 'hide' to exclude specific items
 * 
 * 3. EXPORT STATEMENTS:
 *    - Re-export other libraries
 *    - Syntax: export 'path/to/file.dart';
 *    - Makes imported items available to users of this library
 * 
 * 4. PART / PART OF:
 *    - Split library across multiple files
 *    - Syntax: part 'file.dart'; and part of 'main_library.dart';
 *    - All parts share same scope
 * 
 * 5. LIBRARY STRUCTURE:
 *    - lib/ directory: Public API
 *    - src/ directory: Implementation (private)
 *    - test/ directory: Tests
 *    - example/ directory: Example code
 * 
 * IMPORT TYPES:
 * - Relative import: import 'file.dart';
 * - Absolute import: import 'package:package_name/file.dart';
 * - Dart SDK import: import 'dart:io';
 * 
 * BEST PRACTICES:
 * - Use library declarations
 * - Organize code in lib/ and src/
 * - Export public API only
 * - Use meaningful library names
 */

/**
 * This file demonstrates library structure concepts.
 * In a real project, you would organize code across multiple files.
 */

// Library declaration (optional but recommended)
library learning_dart.intermediate.modules;

// Import Dart SDK libraries
import 'dart:io';
import 'dart:math';

// Import other project files (relative)
// import '../basics/variables.dart';

// Import with alias
import 'dart:convert' as convert;

// Import with show (only import specific items)
// import 'dart:math' show max, min;

// Import with hide (import all except specific items)
// import 'dart:math' hide Random;

void main() {
  print('=== MODULES / LIBRARY STRUCTURE ===\n');
  
  print('--- Library Concepts ---');
  demonstrateLibraryConcepts();
  
  print('\n--- Import Examples ---');
  demonstrateImports();
  
  print('\n--- Library Organization ---');
  demonstrateLibraryOrganization();
  
  print('\n--- Export Examples ---');
  demonstrateExports();
}

/**
 * Demonstrate library concepts
 */
void demonstrateLibraryConcepts() {
  print('''
In Dart, every file is a library:
- No need for explicit library declaration (but recommended)
- Can import code from other libraries
- Can export other libraries
- Can split library across files using part/part of
''');
}

/**
 * Demonstrate import usage
 */
void demonstrateImports() {
  // Using dart:io
  print('Current directory: ${Directory.current.path}');
  
  // Using dart:math
  print('Max of 10 and 20: ${max(10, 20)}');
  print('Min of 10 and 20: ${min(10, 20)}');
  print('PI: $pi');
  
  // Using dart:convert with alias
  Map<String, dynamic> data = {'name': 'John', 'age': 30};
  String json = convert.jsonEncode(data);
  print('JSON: $json');
  
  Map<String, dynamic> decoded = convert.jsonDecode(json);
  print('Decoded: $decoded');
}

/**
 * Demonstrate library organization
 */
void demonstrateLibraryOrganization() {
  print('''
Typical library structure:

my_package/
  lib/
    my_package.dart          # Main library file (exports)
    src/
      core/
        utils.dart           # Private implementation
        helpers.dart
      models/
        user.dart
      services/
        api_service.dart
  test/
    my_package_test.dart
  example/
    example.dart
  pubspec.yaml
''');
}

/**
 * Demonstrate export usage
 */
void demonstrateExports() {
  print('''
Export allows re-exporting other libraries:

// In my_package.dart
library my_package;

export 'src/core/utils.dart';
export 'src/models/user.dart';
export 'src/services/api_service.dart';

// Users can import everything with:
// import 'package:my_package/my_package.dart';
''');
}

/**
 * EXAMPLE LIBRARY STRUCTURE
 * 
 * This demonstrates how to structure a library
 */

// Main library file (lib/my_package.dart)
/*
library my_package;

// Export public API
export 'src/core/utils.dart';
export 'src/models/user.dart';
export 'src/services/api_service.dart';

// Keep implementation private (in src/)
*/

// Utility file (lib/src/core/utils.dart)
/*
library my_package.core.utils;

String formatName(String name) {
  return name.trim().toLowerCase();
}

int calculateAge(DateTime birthDate) {
  return DateTime.now().difference(birthDate).inDays ~/ 365;
}
*/

// Model file (lib/src/models/user.dart)
/*
library my_package.models.user;

class User {
  final String name;
  final int age;
  
  User(this.name, this.age);
  
  @override
  String toString() => 'User(name: $name, age: $age)';
}
*/

// Service file (lib/src/services/api_service.dart)
/*
library my_package.services.api_service;

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
*/

/**
 * PART / PART OF EXAMPLE
 * 
 * Splitting a library across multiple files
 */

// Main file (main_library.dart)
/*
library main_library;

part 'part1.dart';
part 'part2.dart';

void mainFunction() {
  functionFromPart1();
  functionFromPart2();
}
*/

// Part 1 (part1.dart)
/*
part of main_library;

void functionFromPart1() {
  print('From part 1');
}
*/

// Part 2 (part2.dart)
/*
part of main_library;

void functionFromPart2() {
  print('From part 2');
}
*/

/**
 * IMPORT OPTIONS
 */
void demonstrateImportOptions() {
  print('''
Import options:

1. Standard import:
   import 'package:my_package/my_package.dart';

2. Import with alias:
   import 'package:my_package/my_package.dart' as mp;

3. Import specific items (show):
   import 'package:my_package/my_package.dart' show User, ApiService;

4. Import all except (hide):
   import 'package:my_package/my_package.dart' hide User;

5. Deferred import (lazy loading):
   import 'package:my_package/my_package.dart' deferred as mp;
   // Load later: await mp.loadLibrary();
''');
}

/**
 * LIBRARY VISIBILITY
 */
void demonstrateLibraryVisibility() {
  print('''
Library visibility:

1. Public (exported):
   - Items in lib/ directory
   - Can be imported by users

2. Private (not exported):
   - Items in src/ directory
   - Only accessible within package
   - Use underscore prefix for private members

3. Internal:
   - Use 'part' to share code within same library
   - All parts share same scope
''');
}

/**
 * BEST PRACTICES
 */
void demonstrateBestPractices() {
  print('''
Best practices for library structure:

1. Use library declarations for documentation
2. Organize code in lib/ and src/ directories
3. Export only public API
4. Use meaningful names
5. Keep libraries focused (single responsibility)
6. Document public APIs
7. Use part/part of sparingly
8. Prefer composition over large libraries
''');
}

/**
 * EXAMPLE: Creating a utility library
 */

// Utility functions that could be in a separate file
class StringUtils {
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  static String reverse(String text) {
    return text.split('').reversed.join('');
  }
}

class MathUtils {
  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
  
  static bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
}

// Using the utilities
void demonstrateUtilityLibrary() {
  print('\n--- Utility Library Example ---');
  print('Capitalize: ${StringUtils.capitalize("hello")}');
  print('Reverse: ${StringUtils.reverse("Dart")}');
  print('Factorial of 5: ${MathUtils.factorial(5)}');
  print('Is 7 prime? ${MathUtils.isPrime(7)}');
}

