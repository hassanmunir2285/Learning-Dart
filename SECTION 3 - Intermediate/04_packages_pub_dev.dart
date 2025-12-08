/**
 * PACKAGES & PUB.DEV IN DART
 * 
 * WHAT ARE PACKAGES?
 * Packages are reusable libraries of code that can be shared
 * and used in multiple projects.
 * 
 * PUB.DEV:
 * - Official package repository for Dart
 * - Website: https://pub.dev
 * - Contains thousands of packages
 * - Searchable and well-documented
 * 
 * KEY CONCEPTS:
 * 
 * 1. PUBSPEC.YAML:
 *    - Configuration file for Dart projects
 *    - Defines project metadata and dependencies
 *    - Located in project root
 * 
 * 2. DEPENDENCIES:
 *    - Packages your project depends on
 *    - Listed in pubspec.yaml under 'dependencies'
 *    - Can specify version constraints
 * 
 * 3. DEV DEPENDENCIES:
 *    - Packages only needed during development
 *    - Listed under 'dev_dependencies'
 *    - Examples: testing frameworks, linters
 * 
 * 4. PACKAGE TYPES:
 *    - Application packages: Runnable apps
 *    - Library packages: Reusable code
 *    - Plugin packages: Platform-specific code
 * 
 * COMMON COMMANDS:
 * - dart pub get: Install dependencies
 * - dart pub upgrade: Update dependencies
 * - dart pub add <package>: Add a package
 * - dart pub remove <package>: Remove a package
 * - dart pub publish: Publish your package
 * 
 * POPULAR PACKAGES:
 * - http: HTTP client
 * - json_serializable: JSON serialization
 * - path_provider: File system paths
 * - shared_preferences: Local storage
 * - intl: Internationalization
 */

/**
 * NOTE: This file demonstrates package concepts.
 * To use packages, you need to:
 * 1. Create pubspec.yaml file
 * 2. Add dependencies
 * 3. Run: dart pub get
 * 4. Import packages in your code
 */

void main() {
  print('=== PACKAGES & PUB.DEV IN DART ===\n');
  
  print('--- Understanding Packages ---');
  demonstratePackageConcepts();
  
  print('\n--- pubspec.yaml Structure ---');
  demonstratePubspecStructure();
  
  print('\n--- Using Packages ---');
  demonstrateUsingPackages();
  
  print('\n--- Package Management ---');
  demonstratePackageManagement();
}

/**
 * Demonstrate package concepts
 */
void demonstratePackageConcepts() {
  print('''
Packages in Dart allow you to:
1. Reuse code across projects
2. Share code with others
3. Use community-maintained libraries
4. Keep your code organized

pub.dev is the official package repository where you can:
- Search for packages
- View package documentation
- See package popularity and health scores
- Check package versions and changelogs
''');
}

/**
 * Demonstrate pubspec.yaml structure
 */
void demonstratePubspecStructure() {
  print('''
Example pubspec.yaml structure:

name: my_app
description: A sample Dart application
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  http: ^1.1.0
  path: ^1.8.0

dev_dependencies:
  test: ^1.24.0
  linter: ^2.0.0
''');
}

/**
 * Demonstrate using packages
 */
void demonstrateUsingPackages() {
  print('''
To use a package in your code:

1. Add it to pubspec.yaml:
   dependencies:
     http: ^1.1.0

2. Run: dart pub get

3. Import in your code:
   import 'package:http/http.dart' as http;

4. Use the package:
   var response = await http.get(Uri.parse('https://example.com'));
''');
}

/**
 * Demonstrate package management
 */
void demonstratePackageManagement() {
  print('''
Common package management tasks:

1. Add a package:
   dart pub add http

2. Add a dev dependency:
   dart pub add --dev test

3. Remove a package:
   dart pub remove http

4. Update packages:
   dart pub upgrade

5. Get packages (after modifying pubspec.yaml):
   dart pub get

6. List installed packages:
   dart pub deps
''');
}

/**
 * EXAMPLE: pubspec.yaml file content
 * 
 * This is what a typical pubspec.yaml looks like:
 */
/*
name: learning_dart
description: A comprehensive Dart learning project
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  # HTTP client for API requests
  http: ^1.1.0
  
  # JSON serialization
  json_annotation: ^4.8.1
  
  # File path utilities
  path: ^1.8.3
  
  # Command line argument parsing
  args: ^2.4.2

dev_dependencies:
  # Testing framework
  test: ^1.24.0
  
  # Code linter
  linter: ^2.0.0
  
  # JSON serialization code generator
  json_serializable: ^6.7.1
  build_runner: ^2.4.7
*/

/**
 * EXAMPLE: Using packages in code
 * 
 * After adding packages to pubspec.yaml and running 'dart pub get',
 * you can import and use them:
 */

// Example 1: Using http package (if installed)
/*
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    var response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      print('Data: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
*/

// Example 2: Using path package (if installed)
/*
import 'package:path/path.dart' as path;

void demonstratePathPackage() {
  String filePath = path.join('directory', 'subdirectory', 'file.txt');
  print('Joined path: $filePath');
  print('Directory: ${path.dirname(filePath)}');
  print('Filename: ${path.basename(filePath)}');
  print('Extension: ${path.extension(filePath)}');
}
*/

// Example 3: Using args package (if installed)
/*
import 'package:args/args.dart';

void parseArguments(List<String> arguments) {
  var parser = ArgParser()
    ..addOption('name', abbr: 'n')
    ..addFlag('verbose', abbr: 'v');
  
  var results = parser.parse(arguments);
  
  if (results['name'] != null) {
    print('Name: ${results['name']}');
  }
  
  if (results['verbose'] == true) {
    print('Verbose mode enabled');
  }
}
*/

/**
 * PACKAGE VERSIONING
 */
void demonstrateVersioning() {
  print('''
Package versioning follows semantic versioning (semver):
- Major.Minor.Patch (e.g., 1.2.3)

Version constraints in pubspec.yaml:
- ^1.2.3  : Any version >= 1.2.3 and < 2.0.0
- >=1.2.3 : Any version >= 1.2.3
- <2.0.0  : Any version < 2.0.0
- 1.2.3   : Exactly version 1.2.3
- any     : Any version (not recommended)
''');
}

/**
 * CREATING YOUR OWN PACKAGE
 */
void demonstrateCreatingPackage() {
  print('''
To create your own package:

1. Create package structure:
   my_package/
     lib/
       my_package.dart
     pubspec.yaml
     README.md

2. Write your library code in lib/my_package.dart

3. Export public API:
   library my_package;
   export 'src/helper.dart';
   export 'src/utils.dart';

4. Publish to pub.dev:
   dart pub publish

5. Others can use it:
   dependencies:
     my_package: ^1.0.0
''');
}

/**
 * POPULAR PACKAGES CATEGORIES
 */
void demonstratePopularPackages() {
  print('''
Popular package categories on pub.dev:

1. HTTP & Networking:
   - http: HTTP client
   - dio: Powerful HTTP client
   - websocket: WebSocket support

2. JSON & Serialization:
   - json_serializable: Code generation for JSON
   - json_annotation: Annotations for JSON
   - built_value: Immutable value types

3. State Management:
   - provider: State management
   - bloc: Business logic component
   - riverpod: State management

4. File & Storage:
   - path_provider: File system paths
   - shared_preferences: Key-value storage
   - sqflite: SQLite database

5. Testing:
   - test: Testing framework
   - mockito: Mocking framework
   - golden_toolkit: Golden file testing

6. Utilities:
   - intl: Internationalization
   - collection: Collection utilities
   - crypto: Cryptographic functions
''');
}

